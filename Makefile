NAME = ircserv


CXX = c++
CXXVERSION = -std=c++98
CXXFLAGS = -Wall -Werror -Wextra -pedantic


# STYLE AND COLORS
RED = \033[1;31m
GREEN = \033[1;32m
YELLOW = \033[1;33m
PURPLE = \033[1;34m
RESET = \033[0m


# SOURCES
BUILD_DIR = build
HPP = include/main.hpp
MAIN = srcs/main.cpp
SRCS = $(MAIN)

OBJS = $(SRCS:%.cpp=$(BUILD_DIR)/%.o)

all : $(NAME)

$(NAME) : $(OBJS)
	@printf "$(YELLOW) Building : $(PURPLE)%s$(RESET)\n" $@
	@$(CXX) $(CXXVERSION) $(CXXFLAGS) $(OBJS) -o $@



$(BUILD_DIR)/%.o: %.cpp $(HPP)
	@mkdir -p $(dir $@)
	@printf "$(YELLOW) Compile :  $(PURPLE)%s$(RESET)\n" $<
	@$(CXX) $(CXXVERSION) $(CXXFLAGS) -Iinclude -c $< -o $@


clean:
	@printf "$(YELLOW) remove :  $(PURPLE)%s$(RESET)\n" $(OBJS)
	@rm -fr $(OBJS) $(BUILD_DIR)


fclean: clean
	@printf "$(YELLOW) remove :  $(PURPLE)%s$(RESET)\n" $(OBJS)
	@rm -fr $(NAME)



re : fclean all


.PHONY: all clean fclean re 