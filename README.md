# IMPORTANT

- Go to settings and configure pages, deploy from the branch, and then select the root folder. IF YOU DO NOT DO THIS YOUR PAGE WILL NOT BUILD. 

- Incase of issues with the user for your repository not being able to be resolved resulting in the page not building do the following: instead of the usual `repository: yourNameHere` in the repository section write `repository: usr/yourNameHere`

## File Names

- To name a file, use the following structure (Note that dates should never be in the future and should always be in the format YYYY-MM-DD):

- Make sure that notebooks are in the notebook folder and posts are in the posts folder.

  - For markdown files in _posts:
    - year-month-day-fileName.md
      - GOOD EXAMPLE: 2021-08-02-First-Day.md
      - BAD EXAMPLE: 2021-8-2-first-day.md
      - BAD EXAMPLE: first-day.md
      - BAD EXAMPLE: 2069-12-31-First-Day.md

  - For jupyter notebooks in _notebooks:
    - year-month-day-fileName.ipynb
      - GOOD EXAMPLE: 2021-08-02-First-Day.ipynb
      - BAD EXAMPLE: 2021-8-2-first-day.ipynb
      - BAD EXAMPLE: first-day.ipynb
      - BAD EXAMPLE: 2069-12-31-First-Day.ipynb


## NIGHTHAWK-Pages CHANGES

### NEW FOR NIGHTHAWK-Pages - TAGS

- Tags are used to organize pages by their tag the way to add tags is to add the following to your front matter such as the example seen here `categories: [C1.4]` each item in the same category will be lumped together to be seen easily on the tags page. 

### NEW FOR NIGHTHAWK-Pages - SEARCH
- All pages can be searched for using the built in search bar. This search bar will search for any word in the title of a page or in the page itself. This allows for easily finding pages and information that you are looking for. However, sometimes this may not be desirable so to hide a page from search you can add `search_exclude: true` to the front matter of the page. This will hide the page from appearing when the viewer uses search. 

### NEW FOR NIGHTHAWK-Pages -  NAVIGATION BAR

- To add pages to the navigation bar add them to general main directory then add the alpha tag that will order them in the way that you desire such as AA Being the first page and ZZ being the last page. 

### NEW FOR NIGHTHAWK-Pages - HOME PAGE 

- There is a new designed home page with all pages having images and a description of what the page is about. This is to help the viewer understand what the page is about and what they can expect to find on the page. The way to add images to a page is to have the following front matter `image: /images/file.jpg` and then the name of the image that you want to use. The image must be in the `images` folder. Furthermore if you would like the file to not show up on the main page `hide: true` can be added to the front matter.

### NEW FOR NIGHTHAWK-Pages -  SASS CHANGES

- NIGHTHAWK-Pages supports a variety of different themes that are each overlaid on top of minima. To use each theme, go to the custom-styles.scss file and simply uncomment the theme you want to use. To toggle the theme off, comment the line that imports the theme in the file. To add your own themes, find the desired theme’s Github repository and make a new folder in the sass directory that’s named the name of your theme. Copy the import statement format from the other styles on custom-styles.scss, add your own import statement, and you're done. Note that adding your own themes may cause things to break and a given theme’s compatibility with NIGHTHAWK-Pages may be suboptimal. To add your own styling twist, add your own .scss file to custom-styles via import. Here is an example import `@import "minima/NIGHTHAWK-Pages-styles";`. Note that you can also add your own SCSS in the file itself in area labeled specifically for that purpose. Also you can mix different styles together in NIGHTHAWK-Pages however the effects may vary. 

### NEW FOR NIGHTHAWK-Pages -  INCLUDES

- NIGHTHAWK-Pages uses liquid to import many common page elements that are present throughout the repository. These common elements are imported from the _includes directory. If you want to add one of these common elements, use liquid syntax to import the desired element to your file. Here’s an example of liquid syntax used to import: `{%- include post_list.html -%}` Note that the liquid syntax is surrounded by curly braces and percent signs. This can be used anywhere in the repository. 

### NEW FOR NIGHTHAWK-Pages -  LAYOUTS
- To create your own page layout, make your own html page inside the _layouts directory, and when you want to use that layout in a file, use the following front matter `layout: [your layout here]` Using another pre-existing layout uses the same front matter syntax as defined above. This layout will have to be written in your own custom liquid defining the structure of the page. 


### NEW FOR NIGHTHAWK-Pages - CONFIG.YML

- NIGHTHAWK-Pages allows for social links to be added at the bottom of every page, along with other things. To change the pre-set social links and names, go to the _config.yml file and change the desired category to the desired nomenclature. There are only a few supported social links that you can choose from. 


## Blog site using GitHub Pages and Jekyll

> This site is intended for Students.   This is to record plans, complete hacks, and do work for your learnings.

- This can be customized to support computer science as you work through pathway (JavaScript, Python/Flask, Java/Spring)
- All tangible artifact work is in a _posts|_notebooks.  
- Front matter (aka meta data) in ipynb and md files is used to organize information according to week and column in running web site.

## GitHub Pages
All `GitHub Pages` websites are managed on GitHub infrastructure. GitHub uses `Jekyll` to transform your content into static websites and blogs. Each time we change files in GitHub it initiates a GitHub Action that rebuilds and publishes the site with Jekyll.  
- GitHub Pages is powered by: [Jekyll](https://jekyllrb.com/).
- Published teacher website: [nighthawkcoders.github.io/teacher](https://nighthawkcoders.github.io/teacher/)

## Preparing a Preview Site 

In all development, it is recommended to test your code before deployment.  The GitHub Pages development process is optimized by testing your development on your local machine, prior to files on GitHub

Development Cycle. For GitHub pages, the tooling described below will create a development cycle  `make-code-save-preview`.  In the development cycle, it is a requirement to preview work locally, prior to doing a VSCode `commit` to git.

Deployment Cycle.  In the deployment cycle, `sync-github-action-review`, it is a requirement to complete the development cycle prior to doing a VSCode `sync`.  The sync triggers github repository update.  The action starts the jekyll build to publish the website.  Any step can have errors and will require you to do a review.

### WSL and/or Ubuntu installation requirements

- The result of these step is Ubuntu tools to run preview server.  These procedures were created using [jekyllrb.com](https://jekyllrb.com/docs/installation/ubuntu/)
- Run scripts in scripts directory of student repo: setup_ubuntu.sh and activate.sh. Expected name of the repository to run these scripts is 'student'.

### MacOs installation requirements 

- Ihe result of these step are MacOS tools to run preview server.  These procedures were created using [jekyllrb.com](https://jekyllrb.com/docs/installation/macos/). Run scripts in scripts directory of student repo: setup_macos.sh and activate_macos.sh. Expected name of the repository to run these scripts is 'student'.

### Preview

- The result of these step is server running on: http://0.0.0.0:4100/teacher/.  Regeneration messages will run in terminal on any save.  Press the Enter or Return key in the terminal at any time to enter commands.

- Complete installation

```bash
bundle install
```

- Run Server.  This requires running terminal commands `make`, `make stop`, `make clean`, or `make convert` to manage the running server.  Logging of details will appear in terminal.   A `Makefile` has been created in project to support commands and start processes.

  - Start preview server in terminal

    ```bash
    cd ~/vscode/teacher  # my project location, adapt as necessary
    make
    ```

  - Terminal output of shows server address. Cmd or Ctl click http location to open preview server in browser. Example Server address message... 

    ```text
    Server address: http://0.0.0.0:4100/teacher/
    ```

    - Save on ipynb or md activiates "regeneration". Refresh browser to see updates. Example terminal message...
    ```
    Regenerating: 1 file(s) changed at 2023-07-31 06:54:32
        _notebooks/2024-01-04-cockpit-setup.ipynb
    ```

  - Terminal message are generated from background processes.  Click return or enter to obtain prompt and use terminal as needed for other tasks.  Alway return to root of project `cd ~/vscode/teacher` for all "make" actions. 


  - Stop preview server, but leave constructed files in project for your review.

    ```bash
    make stop
    ```

  - Stop server and "clean" constructed files, best choice when renaming files to eliminate potential duplicates in constructed files.

    ```bash
    make clean
    ```

  - Test notebook conversions, best choice to see if IPYNB conversion is acting up.

    ```bash
    make convert
    ```

### Meta Data (Front Matter)

- Meta data also known as front matter is a set of key value pairs that can provide additional information to github pages about .md and .ipynb files. This can and probably will be used in other file types (ie doc, pdf), if we added them to the system.

- In the front matter you can also define things like a title and description for the page.  Additional front matter is defined to place content on "Computer Science Lab Notebook" page.  The `courses:` key will place data on a specific page with the nested `week:` placing data on a specific row on the page.  The `type:` key in front matter will place blog under the plans, hacks(ToDo), and tangibles column. 

- In our files the front matter is defined at the top of the page or the first markdown cell.

  - First open one of the .md or .ipynb files already included in either your _posts|_notebooks folder.

  - In the .md file you should notice something similar to this at the top of the page. To see this in your .ipynb files you will need to double click the markdown cell at the top of the file.

    ```yaml
    ---
    toc: true
    comments: false
    layout: post
    title: Daily Plan Sample
    description: Example Blog!!!  This shows planning and notes from hacks.
    type: plans
    courses: { compsci: {week: 0} }
    ---
    ```

- Front matter will always have '---' at the top and bottom to distinguish it and each key value pair will be separated by a ':'.

- Here we can modify things like the title and description.

- The type value will tells us which column this is going to appear under, supported values: `plans`, `hacks`, `tangibles`.

- The courses tells us which menu item it will be under, in this case the `compsci` menu, and the `week` tells it what row (week) it will appear under that menu.

- In our examples,  hacks(ToDo) contains references to our IPYNB files; these are stored in GitHub under the `_notebooks` folder.   The plans and tangibles contains references to our MD files; these are stored in GitHub under the `_posts` folder.

### Key files in Computer Science Lab Notebook

- `compsci.md` - this is the "Computer Science Lab Notebook" page and is the link `https://nighthawkcoders.github.io/student/compsci`.  It contains the Title and Number of units on the page.
- `_data/compsci.yml` - this contains the supporting data that helps organize the units on the page.
- `_layouts`\schedule.html - this contains code, in the Liquid language, that generates the HTML for all the rows and columns.
- fyi, the schedule.html could work for another type of page.  For instance, you could make a csa.md, _data/csa.yml, and tag files with `csa: {week: 0}` under courses.