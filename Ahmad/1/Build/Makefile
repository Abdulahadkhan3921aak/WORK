# Compiler and flags
CC = gcc -Wall -Wextra -g
RM = rm -f

# Executable name
NAME = sokoban

# Source files
SRC = src/main.c    \
      src/helper.c   \
      src/key_check.c \
      src/loose_check.c \
      src/find_player.c \
      src/map_check.c \
      src/map_reading.c \
      src/movement.c  \
      src/play.c      \
      src/win_check.c \
      src/zone_check.c \
      lib/my_putchar.c \
      lib/my_putstr.c

# Compiler flags
CFLAGS += -I./include/ -I./ncursesw
LDFLAGS += -libncursesw

# Object files
OBJ = $(SRC:.c=.o)

# Default target
all: $(NAME)

# Linking the executable
$(NAME): $(OBJ)
	$(CC) -o $(NAME) $(OBJ) $(LDFLAGS)

# Clean object files
clean:
	$(RM) $(OBJ)

# Clean all generated files
fclean: clean
	$(RM) $(NAME)

# Rebuild the project
re: fclean all

.PHONY: all clean fclean re
