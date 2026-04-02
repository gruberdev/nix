{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  filelock,
  huggingface-hub,
  opencv-python,
  torchvision-bin,
  torch-bin,
  einops,
  scikit-image,
  timm,
  pythonRelaxDepsHook,
}:
buildPythonPackage rec {
  pname = "controlnet-aux";
  version = "0.0.9";
  format = "pyproject";

  src = fetchPypi {
    pname = "controlnet_aux";
    inherit version;
    hash = "sha256-bCg1Lm/pszJNaxKI2U0cJYbG4vyfWN+eRyl+pqhv1WA=";
  };

  timm-override = timm.override {
    torch = torch-bin;
    torchvision = torchvision-bin;
  };

  propagatedBuildInputs = [
    filelock
    huggingface-hub
    opencv-python
    torchvision-bin
    einops
    scikit-image
    timm-override
  ];

  nativeBuildInputs = [
    setuptools
    wheel
    pythonRelaxDepsHook
  ];

  pythonRemoveDeps = ["opencv-python"];
  dontCheckRuntimeDeps = true;

  meta = with lib; {
    description = "Auxillary models for controlnet";
    homepage = "https://pypi.org/project/controlnet-aux/";
    license = licenses.asl20;
  };
}
