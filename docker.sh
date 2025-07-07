#!/bin/bash

# Laravel Docker Management Script

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Docker is running
check_docker() {
    if ! docker info > /dev/null 2>&1; then
        print_error "Docker is not running. Please start Docker first."
        exit 1
    fi
}

# Build and start containers
start() {
    print_status "Starting Laravel application with Docker..."
    check_docker
    
    # Create .env file if it doesn't exist
    if [ ! -f .env ]; then
        print_warning ".env file not found. Copying from .env.example..."
        cp .env.example .env
    fi
    
    # Build and start containers
    docker compose up -d --build
    
    print_status "Containers are starting up..."
    print_status "Laravel setup will run automatically via entrypoint script..."
    
    print_status "Application should be ready shortly! Kindly check container logs for any issues."
    print_status "Access your application at: http://localhost:8000"
    print_status "Access phpMyAdmin at: http://localhost:8080"
}

# Stop containers
stop() {
    print_status "Stopping containers..."
    docker compose down
}

# Stop containers and remove volumes
down() {
    print_status "Stopping containers and removing volumes..."
    docker compose down -v
}

# Restart containers
restart() {
    print_status "Restarting containers..."
    stop
    start
}

# Show logs
logs() {
    docker compose logs -f
}

# Execute artisan commands
artisan() {
    docker compose exec laravel php artisan "$@"
}

# Execute composer commands
composer() {
    docker compose exec laravel composer "$@"
}

# Execute npm commands
npm() {
    docker compose exec laravel npm "$@"
}

# Build assets locally (fallback when Docker npm isn't available)
build() {
    print_status "Building frontend assets locally..."
    npm install
    npm run build
    print_status "Assets built successfully!"
}

# Clean up everything
clean() {
    print_warning "This will remove all containers, images, and volumes. Are you sure? (y/N)"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        print_status "Cleaning up..."
        docker compose down -v --rmi all --remove-orphans
        docker system prune -f
        print_status "Cleanup complete!"
    else
        print_status "Cleanup cancelled."
    fi
}

# Show help
help() {
    echo "Laravel Docker Management Script"
    echo ""
    echo "Usage: ./docker.sh [command]"
    echo ""
    echo "Commands:"
    echo "  start     Build and start all containers"
    echo "  stop      Stop all containers"
    echo "  down      Stop containers and remove volumes"
    echo "  restart   Restart all containers"
    echo "  logs      Show container logs"
    echo "  artisan   Execute artisan commands"
    echo "  composer  Execute composer commands"
    echo "  npm       Execute npm commands"
    echo "  build     Build frontend assets locally"
    echo "  clean     Remove all containers and images"
    echo "  help      Show this help message"
    echo ""
    echo "Examples:"
    echo "  ./docker.sh start"
    echo "  ./docker.sh artisan migrate"
    echo "  ./docker.sh composer install"
    echo "  ./docker.sh npm run dev"
}

# Main script logic
case "${1:-help}" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    down)
        down
        ;;
    restart)
        restart
        ;;
    logs)
        logs
        ;;
    artisan)
        shift
        artisan "$@"
        ;;
    composer)
        shift
        composer "$@"
        ;;
    npm)
        shift
        npm "$@"
        ;;
    build)
        build
        ;;
    clean)
        clean
        ;;
    help)
        help
        ;;
    *)
        print_error "Unknown command: $1"
        help
        exit 1
        ;;
esac
