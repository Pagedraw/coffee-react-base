# Pagedraw's internal React-Coffee-Webpack build system

We want to be as close to create-react-app as possible.  We hope that by being standardized, we can easily pull in new things in the React ecosystem, especially if they're added to create-react-app.  The Pagedraw app itself isn't too far from standard React, so we have no reason to deviate too far.

Pagedraw is using Coffeescript.  Whether we should use Typescript or not is a very open question (Haskell would be better), but compared to ES6, we believe Coffeescript is a strict improvement.

## What this is

There's no way to use Coffeescript with create-react-app, except by ejecting.  We will use this repo to set up a build/deploy environment that is good for Pagedraw, but independent of it.  It should be effectively a starter.

The idea is you will be able to use this as a place to bring in changes from create-react-app, and combine them with the Coffeescript/etc support.  Then, we can bring changes from here into the main Pagedraw repo to keep our build system up to date.


# How to use this

There are 2 branches in this repo:

- master
- ejected-cra

You can safely ignore any other branches.

ejected-cra is the result of ejecting a completely fresh create-react-app.  Something like.

```bash
create-react-app coffee-react-base
cd coffee-react-base
yarn eject
```

Master is ejected-cra plus commits on top to add Coffeescript/etc support.  Master is always commits on top of ejected-cra; it never has modified commits, rebased commits, or extra commits in between things in ejected-cra.  ejected-cra's HEAD is an ancestor of master's HEAD.

When you want to update the create-react-app version you're working on top of, do something like

```bash
# start in the root directory of this repo
git checkout ejected-cra
cd ..
mv coffee-react-base/.git coffee-react-base-git
rm -rf coffee-react-base
create-react-app coffee-react-base
mv coffee-react-base-git coffee-react-base/.git
cd coffee-react-base
# git should be on branch ejected-cra
# all changes should reflect changes in the default react app
git commit -am "updated from cra"
git checkout master
git rebase master
```


