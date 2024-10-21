#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include "ai.h"
#include "utils.h"
#include "hashtable.h"
#include "priority_queue.h"


const int ent_size = 2000;
node_t** expanded_nodes_table;


unsigned expanded_nodes_table_size = ent_size;  // Define the size as needed


// Function to save the solution as a string
char *save_solution(node_t *solution_node)
{
	node_t *n = solution_node;
	char *solution_string = malloc(sizeof(char) * solution_node->depth + 1);
	solution_string[n->depth] = '\0';
	while (n->parent != NULL)
	{
		switch (n->move)
		{
		case up:
			solution_string[n->depth - 1] = (n->state.map[n->state.player_y][n->state.player_x] == '$') ? 'U' : 'u';
			break;
		case down:
			solution_string[n->depth - 1] = (n->state.map[n->state.player_y][n->state.player_x] == '$') ? 'D' : 'd';
			break;
		case left:
			solution_string[n->depth - 1] = (n->state.map[n->state.player_y][n->state.player_x] == '$') ? 'L' : 'l';
			break;
		case right:
			solution_string[n->depth - 1] = (n->state.map[n->state.player_y][n->state.player_x] == '$') ? 'R' : 'r';
			break;
		}
		n = n->parent;
	}
	return solution_string;
}

// Function to copy a source state into a destination state
void copy_state(sokoban_t *init_data, state_t *dst, state_t *src)
{
	dst->map = malloc(sizeof(char *) * init_data->lines);
	for (int i = 0; i < init_data->lines; ++i)
	{
		int width = strlen(src->map[i]) + 1;
		dst->map[i] = malloc(width);
		memcpy(dst->map[i], src->map[i], width);
	}
	dst->player_x = src->player_x;
	dst->player_y = src->player_y;
}

// Function to create the initial node
node_t *create_init_node(sokoban_t *init_data)
{
	node_t *new_n = (node_t *)malloc(sizeof(node_t));
	new_n->parent = NULL;
	new_n->priority = 0;
	new_n->depth = 0;
	new_n->num_childs = 0;
	new_n->move = -1;
	new_n->state.map = malloc(sizeof(char *) * init_data->lines);
	for (int i = 0; i < init_data->lines; ++i)
	{
		int width = strlen(init_data->map[i]) + 1;
		new_n->state.map[i] = malloc(width);
		memcpy(new_n->state.map[i], init_data->map[i], width);
	}
	new_n->state.player_x = init_data->player_x;
	new_n->state.player_y = init_data->player_y;
	return new_n;
}

// Function to create a new node from a parent node
node_t *create_node(sokoban_t *init_data, node_t *parent)
{
	node_t *new_n = (node_t *)malloc(sizeof(node_t));
	new_n->parent = parent;
	new_n->depth = parent->depth + 1;
	copy_state(init_data, &(new_n->state), &(parent->state));
	return new_n;
}

// Function to apply an action to a node and create a new node
bool applyAction(sokoban_t *init_data, node_t *n, node_t **new_node, move_t action)
{
	bool player_moved = false;
	*new_node = create_node(init_data, n);
	(*new_node)->move = action;
	(*new_node)->priority = -(*new_node)->depth;
	player_moved = execute_move_t(init_data, &((*new_node)->state), action);
	return player_moved;
}

void update_explore_table(node_t *n, unsigned expanded_nodes)
{
	// Add the node `n` to the `expanded_nodes_table` at index `expanded_nodes`.
	expanded_nodes_table[expanded_nodes] = n;
}

void free_memory(unsigned expanded_nodes)
{
	// Iterate over the expanded_nodes_table and free the allocated memory for each node.
	for (unsigned i = 0; i < expanded_nodes; i++)
	{
		node_t *node = expanded_nodes_table[i];

		// Free the parent-child relationship.
		free(node->parent);

		// Free the node itself.
		free(node);
	}

	// Free the expanded_nodes_table itself.
	free(expanded_nodes_table);
}

// Function to flatten a map from 2D to 1D
void flatten_map(sokoban_t *init_data, char **dst_map, char **src_map)
{
	int current_i = 0;
	for (int i = 0; i < init_data->lines; ++i)
	{
		int width = strlen(src_map[i]);
		for (int j = 0; j < width; j++)
		{
			(*dst_map)[current_i] = src_map[i][j];
			current_i++;
		}
	}
}

/**
 * Find a solution by exploring all possible paths
 */
void find_solution(sokoban_t *init_data, bool show_solution)
{
	// Keep track of solving time
	clock_t start = clock();

	// Solution String containing the sequence of moves
	char *solution = NULL;

	HashTable hashTable;
	struct heap pq;

	// Statistics
	unsigned generated_nodes = 0;
	unsigned expanded_nodes = 0;
	unsigned duplicated_nodes = 0;
	unsigned solution_size = 0;

	// Choose initial capacity of PRIME NUMBER
	// Specify the size of the keys and values you want to store once
	// The Hash Table only accept a 1D key and value.
	ht_setup(&hashTable, sizeof(int8_t) * init_data->num_chars_map, sizeof(int8_t) * init_data->num_chars_map, 16769023);

	// Data structure to create a 1D representation of the map
	// Needed to interact with the hash table
	char *flat_map = calloc(init_data->num_chars_map, sizeof(char));

	// Initialize heap
	heap_init(&pq);

	// Initialize expanded nodes table.
	// This table will be used to free your memory once a solution is found
	expanded_nodes_table = (node_t**)malloc(sizeof(node_t*) * expanded_nodes_table_size);
	if (expanded_nodes_table == NULL) {
		// Handle allocation failure, e.g., by returning or exiting with an error message.
		fprintf(stderr, "Memory allocation failed.\n");
		return;
	}


	// Add the initial node
	node_t *n = create_init_node(init_data);

	// Use the max heap API provided in priority_queue.h
	heap_push(&pq, n);

	/**
	 * FILL IN THE GRAPH ALGORITHM
	 * */

	//----------------------------

	// Free Memory of HashTable, Explored and flatmap
	ht_clear(&hashTable);
	ht_destroy(&hashTable);
	free_memory(expanded_nodes);
	free(flat_map);
	//----------------------------

	// Stop clock
	clock_t end = clock();
	double cpu_time_used = ((double)(end - start)) / CLOCKS_PER_SEC;

	// Show Soltion
	if (show_solution && solution != NULL)
		play_solution(*init_data, solution);

	endwin();

	if (solution != NULL)
	{
		printf("Found the solution\n");
		printf("\nSOLUTION:                               \n");
		printf("%s\n\n", solution);
		FILE *fptr = fopen("solution.txt", "w");
		if (fptr == NULL)
		{
			printf("Could not open file");
			return;
		}
		fprintf(fptr, "%s\n", solution);
		fclose(fptr);

		free(solution);
	}

	printf("STATS: \n");
	printf("\tExpanded nodes: %'d\n\tGenerated nodes: %'d\n\tDuplicated nodes: %'d\n", expanded_nodes, generated_nodes, duplicated_nodes);
	printf("\tSolution Length: %d\n", solution_size);
	printf("\tExpanded/seconds: %d\n", (int)(expanded_nodes / cpu_time_used));
	printf("\tTime (seconds): %f\n", cpu_time_used);
}

void Solve(char const *path, bool show_solution)
{
	/**
	 * Load Map
	 */
	sokoban_t sokoban = make_map(path, sokoban);

	/**
	 * Count number of boxes and Storage locations
	 */
	map_check(sokoban);

	/**
	 * Locate player x,y position
	 */
	sokoban = find_player(sokoban);
	printf("found player\n");

	sokoban.base_path = path;
	printf("path is : %s", path);

	find_solution(&sokoban, show_solution);

	/* new: free system's components of sokoban */
	free_sokoban(sokoban);
}


struct State {
	state_t state;
	int cost;
	int heuristic;
	node_t* parent;
	move_t move;
};

// Function to calculate the heuristic value of a state.
int Heuristic(const State* state, const State* goal) {
	// Calculate the Manhattan distance between each box and its goal state.
	int box_distances = 0;
	for (int i = 0; i < state->state.num_boxes; i++) {
		box_distances += abs(state->state.boxes[i].x - goal->state.boxes[i].x) + abs(state->state.boxes[i].y - goal->state.boxes[i].y);
	}

	// Return the sum of the box distances.
	return box_distances;
}

// Function to generate all of the successor states of a state.
std::vector<State> GenerateSuccessorStates(const State* state) {
	// Generate all of the successor states of the current state.
	// A successor state is a state that can be reached from the current state
	// by making a single move.
	std::vector<State> successor_states;

	// For each possible move:
	for (int i = 0; i < 4; i++) {

		// Create a new state that is the result of making the move.
		State new_state = *state;

		// Make the move on the new state.
		new_state.state.Move(i);

		// If the new state is valid, then add it to the list of successor states.
		if (new_state.state.IsValid()) {
			successor_states.push_back(new_state);
		}
	}

	return successor_states;
}

// Function to solve the Sokoban puzzle.
State* SolveSokoban(const State* init_state, const State* goal_state) {
	// Create a priority queue to store the states that need to be explored.
	// The priority queue is sorted based on the priority of each state.
	// States with a lower priority are explored first.
	std::priority_queue<State*, std::vector<State*>, CompareStates> queue;

	// Add the initial state to the priority queue.
	queue.push(init_state);

	// While the priority queue is not empty:
	while (!queue.empty()) {

		// Get the state with the lowest priority from the queue.
		// This is the state that is most likely to lead to a solution.
		State* current_state = queue.top();
		queue.pop();

		// If the current state is the goal state, then we have found a solution.
		if (current_state->state == goal_state->state) {
			return current_state;
		}

		// Generate all of the successor states of the current state.
		std::vector<State> successor_states = GenerateSuccessorStates(current_state);

		// For each successor state:
		for (const State* successor_state : successor_states) {

			// Add the successor state to the priority queue.
			queue.push(successor_state);
		}
	}

	// If we reach this point, then there is no solution to the puzzle.
	return nullptr;
}

/*

// Compares two states based on their priority.
int compare_states(const void *a, const void *b)
{
	state_t *state_a = (state_t *)a;
	state_t *state_b = (state_t *)b;
	return state_a->heuristic + state_a->cost - state_b->heuristic - state_b->cost;
}

int Heuristic(state_t *state, state_t *goal)
{
	// Calculate the Manhattan distance between each box and its goal state.
	int box_distances = 0;

	box_distances = abs(state->x - goal->x) + abs(state->y - goal->y);

	// Return the sum of the box distances.
	return box_distances;
}



// Solves a Sokoban puzzle using the A* search algorithm.
state_t *solve(state_t *init_state, state_t *goal_state)
{

	// Create a priority queue to store the states that need to be explored.
	// The priority queue is sorted based on the priority of each state.
	// States with a lower priority are explored first.
	heap *queue = heap_init(compare_states);

	// Add the initial state to the priority queue.
	heap_push(queue, init_state);

	// While the priority queue is not empty:
	while (!empty_heap(queue))
	{

		// Get the state with the lowest priority from the queue.
		// This is the state that is most likely to lead to a solution.
		state_t *current_state = heap_delete(queue);

		// If the current state is the goal state, then we have found a solution.
		if (current_state->x == goal_state->x && current_state->y == goal_state->y)
		{
			return current_state;
		}

		// Generate all of the successor states of the current state.
		// A successor state is a state that can be reached from the current state
		// by making a single move.
		state_t *successor_states[4];
		int num_successor_states = generate_successor_states(current_state, successor_states);

		// For each successor state:
		for (int i = 0; i < num_successor_states; i++)
		{

			// Calculate the cost of the successor state.
			// The cost is the number of moves that it takes to reach the successor state
			// from the initial state.
			int cost = current_state->cost + 1;

			// Calculate the heuristic value of the successor state.
			// The heuristic value is an estimate of the number of moves that it takes
			// to reach the goal state from the successor state.
			int heuristic = Heuristic(successor_states[i], goal_state);

			// Calculate the priority of the successor state.
			// The priority is the sum of the cost and the heuristic value.
			int priority = cost + heuristic;

			// Add the successor state to the priority queue.
			heap_push(queue, successor_states[i]);
		}
	}

	// If we reach this point, then there is no solution to the puzzle.
	return NULL;
}

*/
