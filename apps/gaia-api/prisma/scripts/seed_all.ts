import seedInit from './seed_init.js';
import seed142 from './seed_142.js';
import seed143Types from './seed_143_types.js';


async function main() {
    await seedInit();
    await seed142();
    await seed143Types();
}

main()
  .catch((e) => {
    console.error('An error occurred during the seed process:');
    console.error(e);
    process.exit(1);
  })