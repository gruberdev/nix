{
  lib,
  python313,
  fetchFromGitHub,
  nodejs,
  npm,
}: let
  controlnet-aux = python313.pkgs.callPackage ./controlnet-aux.nix {};
  typer-config = python313.pkgs.callPackage ./typer-config.nix {};

  accelerate-override = python313.pkgs.accelerate.override {
    torch = python313.pkgs.torch-bin;
  };

  peft-override = python313.pkgs.peft.override {
    accelerate = accelerate-override;
    torch = python313.pkgs.torch-bin;
  };
in
  python313.pkgs.buildPythonApplication {
    pname = "iopaint";
    version = "unstable-2025-03-18";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "Sanster";
      repo = "IOPaint";
      rev = "7ca4552241c7e2b6f1c4b4146d2f364af1d1dcbd";
      hash = "sha256-GASRVXUx2E32DsSQ2gPfPe1lBcdydccHOs+uLfel/MI=";
    };

    nativeBuildInputs = [
      nodejs
      npm
    ];

    build-system = [
      python313.pkgs.setuptools
      python313.pkgs.wheel
    ];

    postInstall = ''
            mkdir -p $out/${python313.sitePackages}/iopaint/web_app
            cat > $out/${python313.sitePackages}/iopaint/web_app/index.html << 'EOF'
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>IOPaint</title>
      </head>
      <body>
          <div id="app">
              <h1>IOPaint Web Interface</h1>
              <p>The web frontend is not fully built. Please use the command line interface or build the frontend separately.</p>
              <pre>cd web_app && npm install && npm run build</pre>
          </div>
      </body>
      </html>
      EOF
    '';

    dependencies = with python313.pkgs; [
      controlnet-aux
      diffusers
      easydict
      fastapi
      gradio
      huggingface-hub
      loguru
      omegaconf
      opencv-python
      piexif
      pydantic
      python-multipart
      python-socketio
      rich
      safetensors
      transformers
      typer
      typer-config
      uvicorn
      yacs
    ];

    pythonImportsCheck = [
      "iopaint"
    ];
    pythonRelaxDeps = true;

    meta = {
      description = "Image inpainting tool powered by SOTA AI Model. Remove any unwanted object, defect, people from your pictures or erase and replace(powered by stable diffusion) any thing on your pictures";
      homepage = "https://github.com/Sanster/IOPaint";
      license = lib.licenses.asl20;
      mainProgram = "iopaint";
    };
  }
