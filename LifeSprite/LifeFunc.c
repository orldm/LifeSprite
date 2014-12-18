//
//  LifeFunc.c
//  LifeSprite
//
//  Created by Dmitri Orlov on 12/17/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

#include "LifeFunc.h"

int generateNeighborCoordinates(int coord, int dimX, int dimY, int *cellArray) {
    
    int oldX = coord % dimX;
    int oldY = (coord - oldX) / dimX;
    
    int newX, newY, newCoord;
    
    int neighborCount = 0;
    
    
    for (int xDelta = -1; xDelta <= 1; xDelta++) {
        for (int yDelta = -1; yDelta <= 1; yDelta++) {
            if (xDelta == 0 && yDelta == 0) {
                continue;
            } else {
                newX = oldX + xDelta;
                newY = oldY + yDelta;
                
                if (newX < 0)       { newX = dimX + newX; }
                if (newX >= dimX)   { newX = newX - dimX; }
                if (newY < 0)       { newY = dimY + newY; }
                if (newY >= dimY)   { newY = newY - dimY; }
                
                newCoord = newX + dimX * newY;
                
                if (cellArray[newCoord] == 1) { neighborCount++; }
                
            }
        }
    }
    return neighborCount;
}

void iterateSetInC(int arrayCapacity, int dimX, int dimY, int *cellArray) {
    
    int newCellArray[arrayCapacity];
    int neighborCount;
    
    for (int i = 0; i < arrayCapacity; i++ ){
        
        newCellArray[i] = 0;
        
        neighborCount = generateNeighborCoordinates(i, dimX, dimY, cellArray);
        
        
        if (cellArray[i] == 1) {
            if ((neighborCount == 2) || (neighborCount == 3)) { newCellArray[i] = 1; }
        } else {
            if (neighborCount == 3) { newCellArray[i] = 1; }
        }
        
    }
    
    for (int i = 0; i < arrayCapacity; i++ ){
        
        cellArray[i] = newCellArray[i];
    }
}