---
title: a image diff tool
---

Trying to get a decent image-diff tool for git. Other options
seems to work alright, but here we show removals and additions
if the image is b/w.

Installation
============

The ruby *chunk_png* library is required.

```bash
sudo gem install chunky_png

git config --global core.attributesfile '~/.gitattributes'
cat .gitattributes 
*.gif diff=image
*.jpg diff=image
*.png diff=image

git config --global diff.image.command '~/bin/git-imgdiff'
```


Credits
=======

Shamelessly borrowing from [1] for code and [2] for git setup.


[1]: https://jeffkreeftmeijer.com/2011/comparing-images-and-creating-image-diffs/
[2]: http://www.akikoskinen.info/image-diffs-with-git/
