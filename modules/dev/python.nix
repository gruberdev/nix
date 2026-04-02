{pkgs, ...}: {
  home.sessionVariables = {
    py = "python";
    py2 = "python2";
    py3 = "python3";
    po = "poetry";
    ipy = "ipython --no-banner";
    ipylab = "ipython --pylab=qt5 --no-banner";
  };
  home.packages = with pkgs; [
    bandit
    pipx
    poetry
    pyenv
    pyright
    python313
    python313Packages.black
    python313Packages.debugpy
    python313Packages.ipython
    python313Packages.matplotlib
    python313Packages.mypy
    python313Packages.numpy
    python313Packages.pip
    python313Packages.pylint
    python313Packages.ruff
    python313Packages.setuptools
    python313Packages.virtualenv
    python313Packages.vulture
    uv
    zlib
    zlib-ng
  ];
}
