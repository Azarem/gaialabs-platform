# Gaia Translator Documentation

Welcome to the comprehensive documentation for Gaia Translator - a community platform for collaborative translation of Illusion of Gaia and other game scripts.

## 📚 Documentation Overview

This documentation suite provides everything you need to understand, set up, use, and maintain the Gaia Translator platform.

### 🚀 Quick Start

1. **New to Gaia Translator?** Start with the [Implementation Guide](./IMPLEMENTATION_GUIDE.md)
2. **Ready to translate?** Check out the [User Guide](./USER_GUIDE.md)
3. **Need API access?** See the [API Documentation](./API_DOCUMENTATION.md)
4. **Deploying to production?** Follow the [Deployment Guide](./DEPLOYMENT_GUIDE.md)
5. **Having issues?** Consult the [Troubleshooting Guide](./TROUBLESHOOTING.md)

## 📖 Documentation Files

### [Implementation Guide](./IMPLEMENTATION_GUIDE.md)
**Complete setup and configuration guide**
- Prerequisites and system requirements
- Database setup and configuration
- Environment variable configuration
- Authentication setup with Supabase and GitHub
- Local development workflow
- Data seeding procedures

### [User Guide](./USER_GUIDE.md)
**How to use the translation platform**
- Getting started with translation
- User interface overview
- Translation workflow and best practices
- Community features and collaboration
- AI translation assistance
- Quality assurance process

### [API Documentation](./API_DOCUMENTATION.md)
**Complete API reference**
- Authentication and authorization
- All API endpoints with examples
- Request/response formats
- Error handling and status codes
- Rate limiting and usage guidelines
- SDK information and examples

### [Deployment Guide](./DEPLOYMENT_GUIDE.md)
**Production deployment instructions**
- Pre-deployment checklist
- smarterasp.com specific deployment steps
- Alternative hosting options
- Security configuration
- Monitoring and maintenance
- Backup and recovery procedures

### [shadcn/ui Integration Guide](./SHADCN_UI_INTEGRATION.md)
**Component library integration**
- shadcn/ui setup and configuration
- Component usage examples
- Migration from legacy components
- Accessibility improvements
- Customization and theming
- Best practices and patterns

### [Next.js to Vite Migration Guide](./NEXTJS_TO_VITE_MIGRATION.md)
**SPA architecture migration**
- Complete migration from Next.js to Vite
- Architecture changes and benefits
- Client-side authentication setup
- React Router implementation
- Environment variable updates
- Deployment considerations

### [Troubleshooting Guide](./TROUBLESHOOTING.md)
**Common issues and solutions**
- Installation and setup problems
- Database connection issues
- Authentication problems
- Performance optimization
- Error resolution strategies
- Getting additional help

## 🏗️ Architecture Overview

### Technology Stack

- **Frontend**: Vite + React 19 SPA (migrated from Next.js)
- **Backend**: Node.js with TypeScript
- **Database**: PostgreSQL with Prisma ORM
- **Authentication**: Client-side Supabase Auth with GitHub OAuth
- **AI Integration**: OpenAI API for translation assistance
- **UI Components**: shadcn/ui with Radix UI primitives
- **Styling**: Tailwind CSS with CSS variables and custom design system
- **Build Tool**: Vite 6.0.7 with optimized bundling
- **Routing**: React Router 6.28.0
- **Deployment**: Static hosting (Vercel, Netlify, Railway, etc.)

### Key Features

- **Collaborative Translation**: Real-time collaborative editing
- **Community Platform**: Comments, reviews, and discussions
- **AI Assistance**: Intelligent translation suggestions
- **Version Control**: Complete translation history
- **Quality Assurance**: Role-based review system
- **Data Management**: Import/export in multiple formats
- **Responsive Design**: Mobile-friendly interface

### Database Schema

The application uses a comprehensive PostgreSQL schema with these main entities:

- **Users**: User accounts, roles, and statistics
- **Games**: Game information and metadata
- **Locations**: Game locations and areas
- **Scripts**: Original game text and metadata
- **Translations**: User-generated translations
- **Comments**: Community discussions
- **Reviews**: Quality assurance and approval workflow

## 🔧 Development Workflow

### Setting Up Development Environment

1. **Clone the repository**
2. **Install dependencies**: `pnpm install`
3. **Set up database**: Follow database setup in Implementation Guide
4. **Configure environment**: Copy and edit `.env.example`
5. **Run migrations**: `pnpm db:migrate`
6. **Seed database**: `pnpm db:seed`
7. **Start development**: `pnpm translator:dev`

### Development Commands

```bash
# Development
pnpm translator:dev          # Start development server
pnpm translator:build        # Build for production
pnpm lint                    # Run linting
pnpm type-check             # TypeScript checking

# Database
pnpm translator:db:generate  # Generate Prisma client
pnpm translator:db:migrate   # Run migrations
pnpm translator:db:seed      # Seed database
pnpm translator:db:studio    # Open Prisma Studio

# Data Management
tsx scripts/sync-data.ts     # Sync ASM data
tsx scripts/backup.ts        # Create backup
```

## 🌍 Community and Contribution

### Getting Involved

- **Translation**: Contribute translations in your language
- **Review**: Help review and improve translations
- **Development**: Contribute code improvements
- **Documentation**: Help improve guides and documentation
- **Community**: Help newcomers and moderate discussions

### Translation Guidelines

- **Accuracy**: Stay faithful to the original meaning
- **Consistency**: Use established terminology
- **Context**: Consider game situation and character
- **Quality**: Aim for natural, fluent translations
- **Collaboration**: Work with the community

### Code Contribution

1. **Fork the repository**
2. **Create feature branch**
3. **Make changes with tests**
4. **Submit pull request**
5. **Participate in code review**

## 📊 Project Status

### Current Features

- ✅ User authentication and authorization
- ✅ Script browsing and filtering
- ✅ Translation creation and editing
- ✅ Community comments and discussions
- ✅ Review and approval workflow
- ✅ AI translation assistance
- ✅ Data import/export
- ✅ Responsive web interface

### Planned Features

- 🔄 Real-time collaborative editing
- 🔄 Advanced search and filtering
- 🔄 Translation memory integration
- 🔄 Mobile application
- 🔄 Advanced analytics and reporting
- 🔄 Multi-game support expansion

### Version History

- **v1.0.0**: Initial release with core features
- **v1.1.0**: Enhanced AI integration
- **v1.2.0**: Improved community features
- **v2.0.0**: Real-time collaboration (planned)

## 🆘 Getting Help

### Support Channels

1. **Documentation**: Start with these guides
2. **GitHub Issues**: Report bugs and request features
3. **Community Forum**: Ask questions and get help
4. **Email Support**: technical-support@gaialabs.dev

### Reporting Issues

When reporting issues, please include:
- **Environment**: OS, browser, Node.js version
- **Steps to reproduce**: Detailed reproduction steps
- **Expected vs actual behavior**
- **Error messages**: Full error messages and stack traces
- **Screenshots**: If applicable

### Contributing to Documentation

Help improve this documentation:
- **Fix errors**: Submit corrections
- **Add examples**: Provide more examples
- **Improve clarity**: Make instructions clearer
- **Add translations**: Translate docs to other languages

## 📄 License and Legal

### License

This project is licensed under the MIT License. See the [LICENSE](../../LICENSE) file for details.

### Privacy and Data

- User data is handled according to our Privacy Policy
- GitHub OAuth is used for authentication
- Translation data is stored securely
- Community contributions are publicly visible

### Terms of Service

By using Gaia Translator, you agree to:
- Respect other community members
- Provide accurate translations
- Follow community guidelines
- Respect intellectual property rights

## 🙏 Acknowledgments

### Contributors

Thank you to all the translators, reviewers, and developers who make this project possible.

### Special Thanks

- **ROM Hacking Community**: For preserving and documenting classic games
- **Illusion of Gaia Community**: For their passion and dedication
- **Open Source Projects**: For the tools and libraries that make this possible

### Credits

- **Game**: Illusion of Gaia by Quintet/Enix
- **Original Translation**: Nintendo of America
- **ROM Data**: Community preservation efforts
- **Platform**: Built with modern web technologies

---

**Last Updated**: January 2024  
**Version**: 1.0.0  
**Maintainers**: GaiaLabs Team

For the most up-to-date information, visit the [GitHub repository](https://github.com/gaialabs/gaialabs-platform) or check the [project website](https://gaialabs.dev).
