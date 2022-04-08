## DARPA-ACTM: Assessing Risks of High-Impact Climate Changes and Tipping Points with a Data-Informed Climate Model

The overall goal of this project is to achieve a step change in the accuracy of representation of clouds in climate models, to quantify uncertainties in the models, and to use the models with quantified uncertainties to assess risks of high-impact climate changes and tipping points. This project is funded by the Defense Advanced Research Projects Agency (Agreement No. HR00112290030), as a part of the *AI-assisted Climate Tipping-point Modeling* program.

### Principal Investigators

- [Tapio Schneider](https://climate-dynamics.org/people/tapio-schneider/), California Institute of Technology
- [Anima Anandkumar](http://tensorlab.cms.caltech.edu/users/anima/), California Institute of Technology

### Repositories associated with the project

- `EnsembleKalmanProcesses.jl` (EKP) is a library of derivative-free Bayesian optimization techniques based on the Ensemble Kalman Filters, a well known family of approximate filters used for data assimilation. You can access the repository [here](https://github.com/CliMA/EnsembleKalmanProcesses.jl), and the documentation [here](https://clima.github.io/EnsembleKalmanProcesses.jl/dev/).

- `TurbulenceConvection.jl` (TC) is a software package that implements the extended eddy-diffusivity mass-flux scheme (EDMF) of atmospheric turbulence and convection. The package also provides standalone drivers to simulate the lower troposphere on a single-column basis. You can access the repository [here](https://github.com/CliMA/TurbulenceConvection.jl). The documentation for this package is still under development.

- `CalibrateEDMF.jl` is a software package that leverages the Bayesian optimization techniques housed in `EnsembleKalmanProcesses.jl` to learn cloud process parameterizations within an eddy-diffusivity mass-flux scheme (EDMF) of atmospheric turbulence and convection, and quantify their uncertainty. You can access the repository [here](https://github.com/CliMA/CalibrateEDMF.jl). The documentation for this package is still under development.


Module                                      | Purpose
--------------------------------------------|--------------------------------------------------------
EnsembleKalmanProcesses.jl                  | Implementation of gradient-free optimization techniques
TurbulenceConvection.jl                     | Implementation of EDMF scheme of turbulence, convection and clouds
CalibrateEDMF.jl                            | Framework to learn about cloud procesess from data
