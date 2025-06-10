.PHONY: all build up down clean fclean re status

all: build up

build:
	@echo "\033[1;34mStarting the build process...\033[0m"
	@echo "\033[1;34mBuilding Docker images...\033[0m"
	@docker-compose -f srcs/docker-compose.yml build > /dev/null
	@echo "\033[1;34mCreating necessary directories...\033[0m"
	@sudo mkdir -p /home/abdellah/data/wordpress > /dev/null
	@sudo mkdir -p /home/abdellah/data/mariadb > /dev/null
	@sudo mkdir -p /home/abdellah/data/redis > /dev/null
	@echo "\033[1;34mBuild process complete.\033[0m"

up:
	@echo "\033[1;32mSetting up directories and starting containers...\033[0m"
	@docker-compose -f srcs/docker-compose.yml up -d > /dev/null
	@echo "\033[1;32mContainers are up and running.\033[0m"

down:
	@echo "\033[1;33mStopping and removing containers...\033[0m"
	@docker-compose -f srcs/docker-compose.yml down > /dev/null
	@echo "\033[1;33mContainers stopped and removed.\033[0m"

clean: down
	@echo "\033[1;31mCleaning up Docker volumes...\033[0m"
	@docker volume prune -f > /dev/null
	@echo "\033[1;31mCleanup complete.\033[0m"

fclean: clean
	@echo "\033[1;31mPerforming a full system clean...\033[0m"
	@docker system prune -af > /dev/null
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q) > /dev/null; fi
	@echo "\033[1;31mRemoving data directories...\033[0m"
	@sudo rm -rf /home/abdellah/data/* > /dev/null
	@echo "\033[1;31mFull system clean complete.\033[0m"

re: fclean all
	@echo "\033[1;35mRebuilding everything from scratch...\033[0m"

status:
	@echo "\033[1;36mChecking Docker container status...\033[0m"
	@docker-compose -f srcs/docker-compose.yml ps
	@echo "\033[1;36mStatus check complete.\033[0m"