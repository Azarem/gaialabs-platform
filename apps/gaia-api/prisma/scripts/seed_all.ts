import seedInit from './seed_init.js';
import seed142 from './seed_142.js';
import seed143 from './seed_143.js';


async function main() {
    await seedInit();
    await seed142();
    await seed143();
}

main()
  .catch((e) => {
    console.error('An error occurred during the seed process:');
    console.error(e);
    process.exit(1);
  })