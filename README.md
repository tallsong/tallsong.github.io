# headline
This is my personal home page.

# run this project in apple container
```bash

container system start
container system status

container build -t jekyll-site .

container run --rm -it \
  --name jekyll-site \
  -p 4000:4000 \
  -v "$(pwd)":/usr/src/app \
  -e JEKYLL_ENV=docker \
  jekyll-site

```


# Jekyll


some helpful commond
```bash
# Build the site and make it available on a local server
bundle exec jekyll server --livereload
bundle exec jekyll serve --livereload --host 192.168.18.198
```

merge origin
```bash
git fetch upstream
it push origin main
```


# reference
https://github.com/academicpages/academicpages.github.io
https://jekyllrb.com

