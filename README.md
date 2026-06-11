# Resumes

I organize my resume in here, the latest is always Cole_Fuerth_Resume.pdf.

## building

I used to use the Makefile, which is probably the easiest way to build, but it requires texlive-full installed, which is like 6gb so that is deprecated.

These days I just use `nix build`, and the new resume shows up in `result/`.

There will soon be a release action, and I will stop uploading the raw pdf in favor of just using the (much more lightweight) flake to build, and maybe a remote builder I will host locally. ezpz
