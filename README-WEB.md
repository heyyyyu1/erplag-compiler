# ERPLAG Compiler - Web Interface

Interactive web interface for the ERPLAG compiler built with React and Node.js.

## Architecture

- **Frontend**: React + Vite
- **Backend**: Node.js + Express
- **Compiler**: Original C compiler

## Setup Instructions

### 1. Build the Compiler

First, ensure the C compiler is built:

```bash
make
```

### 2. Setup Backend

```bash
cd backend
npm install
```

### 3. Setup Frontend

```bash
cd frontend
npm install
```

## Running the Application

### Start Backend Server (Terminal 1)

```bash
cd backend
npm start
```

The backend will run on `http://localhost:5000`

### Start Frontend Dev Server (Terminal 2)

```bash
cd frontend
npm run dev
```

The frontend will run on `http://localhost:3000`

## Usage

1. Open your browser to `http://localhost:3000`
2. Write your ERPLAG code in the editor
3. Select a compiler option from the dropdown:
   - **LEXER**: View all tokens
   - **PARSER**: See parse tree traversal
   - **AST**: View abstract syntax tree
   - **MEMORY**: Check compression ratio
   - **SYMBOL TABLE**: View symbol table
   - **Activation Record Size**: See memory allocation
   - **Static and Dynamic Arrays**: View array information
   - **Error Reporting**: Full compilation with timing
   - **Code Generation**: Generate assembly code
4. Click "Compile" to run
5. View output in the right panel

## Features

- **Interactive Code Editor**: Write ERPLAG code with syntax highlighting
- **Real-time Compilation**: Compile and see results instantly
- **Multiple Options**: Access all 9 compiler stages
- **Sample Code**: Load example programs
- **Assembly Output**: View generated NASM assembly code
- **Error Display**: Clear error messages and diagnostics
- **Responsive Design**: Works on desktop and mobile

## API Endpoints

- `POST /api/compile` - Compile ERPLAG code
  ```json
  {
    "code": "string",
    "option": 1-9
  }
  ```

- `GET /api/sample` - Get sample code
- `GET /api/health` - Health check

## Project Structure

```
.
├── frontend/
│   ├── src/
│   │   ├── App.jsx          # Main React component
│   │   ├── App.css          # Styling
│   │   ├── main.jsx         # Entry point
│   │   └── index.css        # Global styles
│   ├── index.html           # HTML template
│   ├── vite.config.js       # Vite configuration
│   └── package.json         # Frontend dependencies
│
├── backend/
│   ├── server.js            # Express server
│   ├── temp/                # Temporary compilation files
│   └── package.json         # Backend dependencies
│
└── README-WEB.md            # This file
```

## Development

### Frontend Development

The frontend uses Vite for fast hot-module replacement:

```bash
cd frontend
npm run dev
```

### Backend Development

Use nodemon for auto-restart on changes:

```bash
cd backend
npm run dev
```

## Production Build

### Build Frontend

```bash
cd frontend
npm run build
```

The built files will be in `frontend/dist/`

### Serve Production Build

```bash
cd frontend
npm run preview
```

## Troubleshooting

### Compiler not found
Ensure you've run `make` in the root directory to build the compiler.

### Port already in use
Change the port in:
- `backend/server.js` (PORT variable)
- `frontend/vite.config.js` (server.port)

### Compilation errors
Check that:
1. The compiler executable exists
2. Required files (grammar.txt) are in the root directory
3. Backend has permissions to create temp files

## Notes

- The backend creates temporary files in `backend/temp/` for each compilation
- Files are automatically cleaned up after compilation
- The compiler must be built before starting the backend
- For production, consider using a process manager like PM2 for the backend
