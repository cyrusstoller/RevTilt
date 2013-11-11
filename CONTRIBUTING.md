# How to contribute

Third-party patches help make [RevTilt](http://www.revtilt.com) great.
Here are a few guidelines that I ask contributors to follow so that I can stay on top of things.

## Getting Started

* Make sure you have a [GitHub account](https://github.com/signup/free)
* Submit an issue, assuming one does not already exist for the bug or feature you would like [here](https://github.com/cyrusstoller/RevTilt/issues)
  * Clearly describe the issue including steps to reproduce the bug or the desired behavior for the new feature.
* Fork the repository on GitHub

## Making Changes

* Create a topic branch from where you want to base your work.
  * This should almost always be the master branch.
  * To quickly create a topic branch based on master; `git branch
    fix/master/my_contribution master` then checkout the new branch with `git
    checkout fix/master/my_contribution`.  Please avoid working directly on the
    `master` branch.
* Make commits of logical units (small commits are fine since I may want to [cherry-pick](http://git-scm.com/docs/git-cherry-pick) later).
* Check for unnecessary whitespace with `git diff --check` before committing.
* Make sure you have added the necessary tests for your changes.
* Run _all_ the tests to assure nothing else was accidentally broken.

## Submitting Changes

* Push your changes to a topic branch in your fork of the repository.
* Submit a pull request to the cyrusstoller/revtilt repository.

# Additional Resources

* [General GitHub documentation](http://help.github.com/)
* [GitHub pull request documentation](http://help.github.com/send-pull-requests/)

*Credit:* This document has been based liberally off of the contribution guide for [puppet](https://github.com/puppetlabs/puppet/blob/master/CONTRIBUTING.md).