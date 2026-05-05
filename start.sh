#!/bin/bash

echo "=========================================="
echo "ERPLAG Compiler Web Interface"
echo "=========================================="
echo ""

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -f "$PROJECT_DIR/compiler" ]; then
    echo "Compiler not found. Building..."
    make -C "$PROJECT_DIR"
fi

echo "Starting Backend Server..."
cd "$PROJECT_DIR/backend"
npm start &
BACKEND_PID=$!

echo "Waiting for backend to start..."
sleep 3

echo "Starting Frontend Dev Server..."
cd "$PROJECT_DIR/frontend"
npm run dev &
FRONTEND_PID=$!

echo ""
echo "=========================================="
echo "Servers started successfully!"
echo "=========================================="
echo ""
echo "Backend:  http://localhost:5000"
echo "Frontend: http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop both servers"
echo "=========================================="

trap "echo 'Stopping servers...'; kill $BACKEND_PID $FRONTEND_PID; exit" INT

wait
