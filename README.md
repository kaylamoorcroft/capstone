# Course Map - A Course Planning Web Application (Capstone Project)

## Key Features
*   Course planning for full degree
*   Schedule courses for your upcoming year
*   Figure out your electives
*   Personalised dashboard for your specialization
*   Get recommendations

## Getting Started
### Prerequisites
*   Download and install [AMPPS](https://www.ampps.com/download)
*   Install Sass (eg. VSCode extension - Live Sass Compiler by Glenn Marks)

### Installation & Setup
1. Place the project folder inside your AMPPS web root directory. E.g., for macOS this is `/Applications/AMPPS/www/`
2. Open AMPPS and start Apache and MySQL in the control panel
3. Open the Apache configuration settings (`httpd.conf`) and ensure the `mod_rewrite` module is enabled
4. Access [phpMyAdmin](http://localhost/phpmyadmin), create a new database for this project and import `database/courseCatalogue_db.sql`
5. Navigate to `http://localhost/capstone` to run the app

## Repository Structure
```text
├── database/              # SQL file to import into phpMyAdmin
├── public/                # Content shown to web browser
│   ├── ajax/              # Ajax based php files
│   ├── api/               # Any php files that return JSON objects
│   ├── css/               
│   ├── images/
│   └── js/
│       ├── components/    # Core UI components used in pages
│       ├── pages/         # js scripts for each page 
│       ├── services/      # Fetching data at php endpoints / manipulating that data
│       └── utils/         # Any other helpful functions to be reused across app
└── src/
    ├── config/            # db connection credentials
    └── sass/              # style files broken up into pages and components
