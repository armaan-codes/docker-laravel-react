# Laravel 12 + Docker Development Environment

A modern Laravel application with Docker containerization, featuring Laravel 12, PHP 8.4, Node.js 24, Tailwind CSS v4, and Vite for a cutting-edge development experience.

## 🚀 Tech Stack

- **Backend**: Laravel 12 (PHP 8.4)
- **Frontend**: Tailwind CSS v4 + Vite 6
- **Database**: MySQL 8.0
- **Cache/Sessions**: Redis
- **Containerization**: Docker + Docker Compose
- **Package Manager**: Composer (PHP) + npm (Node.js)

## 📋 Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Docker** (version 20.10 or higher)
- **Docker Compose** (v2 - modern syntax)
- **Node.js** (version 18 or higher) - for local asset building
- **npm** (comes with Node.js)
- **Git** (for version control)

### Check Prerequisites
```bash
# Check Docker
docker --version
docker compose version

# Check Node.js and npm
node --version
npm --version
```

## 🎯 Quick Start

### 1. First Time Setup
Run the automated setup script:
```bash
chmod +x docker.sh
./docker.sh start
```

This command will automatically:
- ✅ Create `.env` file from `.env.example`
- ✅ Install npm dependencies
- ✅ Build frontend assets (Vite + Tailwind CSS)
- ✅ Build and start Docker containers
- ✅ Generate Laravel application key
- ✅ Run database migrations
- ✅ Seed the database

### 2. Access Your Application
- **Main Application**: http://localhost:8000
- **Database Admin (phpMyAdmin)**: http://localhost:8080
- **MySQL**: localhost:3306
- **Redis**: localhost:6379

## 🐳 Docker Management

The project includes a convenient management script (`docker.sh`) with the following commands:

### Development Commands
```bash
# Start everything (first time or after changes)
./docker.sh start

# Stop containers (keeps data)
./docker.sh stop

# Stop containers and remove volumes (fresh start)
./docker.sh down

# Restart containers
./docker.sh restart

# View container logs
./docker.sh logs
```

### Application Commands
```bash
# Run Laravel Artisan commands
./docker.sh artisan migrate
./docker.sh artisan make:controller UserController
./docker.sh artisan tinker

# Run Composer commands
./docker.sh composer install
./docker.sh composer require package-name

# Build frontend assets locally
./docker.sh build

# Run npm commands (if Node.js is available in container)
./docker.sh npm install
./docker.sh npm run dev
```

### Cleanup Commands
```bash
# Nuclear option: remove everything
./docker.sh clean

# Get help
./docker.sh help
```

## 🛠️ Development Workflow

### Frontend Development
The project uses Vite for fast development and Tailwind CSS v4 for styling:

```bash
# Install dependencies
npm install

# Development mode (with hot reloading)
npm run dev

# Production build
npm run build
```

### Backend Development
Laravel commands can be run through Docker:

```bash
# Create new controller
./docker.sh artisan make:controller ExampleController

# Create migration
./docker.sh artisan make:migration create_example_table

# Run migrations
./docker.sh artisan migrate

# Run tests
./docker.sh artisan test
```

### Docker Services
- **laravel**: Main application container (PHP 8.4 + Nginx)
- **mysql**: MySQL 8.0 database
- **redis**: Redis for caching and sessions
- **phpmyadmin**: Database management interface

## 🚨 Troubleshooting

### Common Issues

**1. "Vite manifest not found" error:**
```bash
# Build assets first
./docker.sh build
```

**2. Database connection issues:**
```bash
# Restart with fresh database
./docker.sh down
./docker.sh start
```

**3. Permission issues:**
```bash
# Fix file permissions
sudo chown -R $USER:$USER .
```

**4. Port conflicts:**
- Change ports in `docker-compose.yml` if 8000, 3306, or 6379 are in use

**5. Docker build fails:**
```bash
# Clean Docker cache
./docker.sh clean
docker system prune -a
```

### Logs and Debugging
```bash
# View all container logs
./docker.sh logs

# View specific service logs
docker compose logs laravel
docker compose logs mysql

# Enter container for debugging
docker compose exec laravel bash
```

## 🔄 Development Tips

1. **Hot Reloading**: Use `npm run dev` for frontend development with hot reloading
2. **Database**: Use phpMyAdmin at http://localhost:8080 for easy database management
3. **Caching**: Clear Laravel caches with `./docker.sh artisan optimize:clear`
4. **Queue Workers**: Background jobs are automatically processed via Supervisor
5. **Testing**: Run tests with `./docker.sh artisan test`

## 📚 Additional Resources

- [Laravel Documentation](https://laravel.com/docs)
- [Tailwind CSS v4 Documentation](https://tailwindcss.com/docs)
- [Vite Documentation](https://vitejs.dev/guide/)
- [Docker Documentation](https://docs.docker.com/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

---

**Happy coding!** 🎉