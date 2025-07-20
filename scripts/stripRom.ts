import { open } from 'node:fs/promises';
import { resolve, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const PAGE_SIZE = 0x8000; // 32KB
const ROM_PATH = resolve(__dirname, '../truth/iog.smc');

async function stripRom() {
	console.log(`Starting to modify ROM: ${ROM_PATH}`);

	let fileHandle;
	try {
		fileHandle = await open(ROM_PATH, 'r+');
		const stats = await fileHandle.stat();
		const fileSize = stats.size;

		console.log(`File size: ${fileSize} bytes`);

		const zeroBuffer = Buffer.alloc(PAGE_SIZE, 0);

		for (let offset = 0; offset < fileSize; offset += 2 * PAGE_SIZE) {
			const bytesToWrite = Math.min(PAGE_SIZE, fileSize - offset);

			if (bytesToWrite <= 0) {
				break;
			}

			console.log(
				`Zeroing out page at offset 0x${offset.toString(16)} (${bytesToWrite} bytes)`,
			);
			await fileHandle.write(zeroBuffer, 0, bytesToWrite, offset);
		}

		console.log('Successfully modified the ROM.');
	} catch (error) {
		console.error('An error occurred while modifying the ROM:', error);
	} finally {
		await fileHandle?.close();
	}
}

stripRom(); 