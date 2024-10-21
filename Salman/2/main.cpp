#include <iostream>
#include <sstream>

// Define a structure for tree nodes
struct Node
{
    int m;
    int n;
    Node *left;  // For the case when m is not 0
    Node *right; // For the case when n is not 0
    Node(int m, int n) : m(m), n(n), left(nullptr), right(nullptr) {}
};

// Function to build the Ackermann tree
Node *ackermannTree(int m, int n)
{
    Node *node = new Node(m, n);
    if (m == 0)
    {
        // If m is 0, the result is n+1, so no children are needed.
        return node;
    }
    else if (n == 0)
    {
        // If n is 0, we compute A(m-1, 1).
        node->left = ackermannTree(m - 1, 1);
    }
    else
    {
        // For n not 0, we need to compute A(m, n-1) first (right child),
        // and then A(m-1, result of right child) (left child).
        node->right = ackermannTree(m, n - 1);
        node->left = ackermannTree(m - 1, node->right->m == 0 ? node->right->n : 0);
    }
    return node;
}

// Function to print the edges of the tree
void printEdges(Node *node)
{
    if (!node)
    {
        return;
    }

    // Print leaf nodes.
    if (node->m == 0)
    {
        std::cout << "Leaf node: " << node->n + 1 << "(0)" << std::endl;
        return;
    }

    // Print edges to child nodes.
    if (node->left)
    {
        std::cout << "Left child of " << node->m << ":" << node->n << ": ";
        if (node->left->m != 0)
        {
            std::cout << node->left->m << ":" << node->left->n << std::endl;
            printEdges(node->left);
        }
        else
        {
            std::cout << node->left->n + 1 << "(0)" << std::endl;
        }
    }

    if (node->right)
    {
        std::cout << "Right child of " << node->m << ":" << node->n << ": ";
        if (node->right->m != 0)
        {
            std::cout << node->right->m << ":" << node->right->n << std::endl;
            printEdges(node->right);
        }
        else
        {
            std::cout << node->right->n + 1 << "(0)" << std::endl;
        }
    }
}

// Function to delete the tree from memory
void deleteTree(Node *node)
{
    if (!node)
        return;
    deleteTree(node->left);
    deleteTree(node->right);
    delete node;
}

int main()
{
    int m, n;
    std::cout << "Enter the values of m and n for the Ackermann function: ";
    std::cin >> m >> n;

    Node *root = ackermannTree(m, n);
    printEdges(root);
    deleteTree(root);

    return 0;
}