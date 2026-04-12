#ifndef ASTDEF_H_
#define ASTDEF_H_

#include "parserDef.h"

typedef enum {Leaf = 1, Internal = 0} nodeType; 

typedef struct leaf
{
    char * lexeme;
    void * value;
    char * type;
    int lineNum;
} leaf;

typedef struct internal
{
    char * label;
    int lineNumStart;
    int lineNumEnd;
} internal;

typedef union nodeEle
{
    leaf * leafNode;
    internal * internalNode;
} nodeEle;

typedef struct astEle
{
    nodeType tag;
    nodeEle ele;
} astEle;

typedef struct astNode
{
    astEle * node;
    struct astNode * sibling;
    struct astNode * child;
}astNode;

#endif