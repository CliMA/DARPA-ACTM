### Principal Investigators

- [Tapio Schneider](https://climate-dynamics.org/people/tapio-schneider/), California Institute of Technology
- [Anima Anandkumar](http://tensorlab.cms.caltech.edu/users/anima/), California Institute of Technology


## DARPA-ACTM: Assessing Risks of High-Impact Climate Changes and Tipping Points with a Data-Informed Climate Model

Climate change is poised to reshape our world, from challenging limits of water management infrastructure to necessitating adjustments to DoD’s strategic posture. For example, climate change may push outdoor temperature and humidity in regions such as the Persian Gulf beyond what humans can endure, or it may disrupt freshwater supply in sub-Saharan Africa, in either case possibly triggering mass migrations and geopolitical shifts. 

The overall goal of this project is to achieve a step change in the accuracy of representation of clouds in climate models, to quantify uncertainties in the models, and to use the models with quantified uncertainties to assess risks of high-impact climate changes and tipping points. This project is funded by the Defense Advanced Research Projects Agency (Agreement No. HR00112290030), as a part of the *AI-assisted Climate Tipping-point Modeling* program.

Current Earth System models (ESMs) are not able to quantify the risks especially of low-probability, high-impact climate changes with irreversible consequences. These models suffer from biases traced back to the representation of small scale processes that cannot be resolved in a global simulations. One of the most notorious of these processes is the dynamics of clouds and turbulence, which play a crucial role in controlling weather and climate. ESMs rely on parameterizations for representing clouds and turbulence and inadequacies in these parameterizations have hampered ESMs for decades; they are the largest source of physical uncertainties in climate predictions. Machine learning (ML) represents an exciting opportunity in Earth system modeling and specifically for the parameterization problem. However, the application of ML brings its own set of challenges. These include the difficulty in enforcing conservation laws and resolution dependence of ML models (which requires retraining for each ESM resolution); and the sparse and indirect data available for training such 'data hungry' models.

We address these ML issues by employing a hybrid model as a parameterization, and training a Fourier Neural Operator (FNO) using a gradient free training method. The physical model is the Extended EDMF, which was shown to represent the entire spectrum of turbulent and convective motions using physical closures [^1], [^2], [^3] [blog-post](https://clima.caltech.edu/2020/12/04/resolving-small-scale-uncertainties-in-climate-models/). Learning a closure (i.e. terms in the equations) of the EDMF model greatly reduces the degrees of freedom in the problem and the amount of data needed to constrain them. The gradient free - hybrid model approach we plan to use is successfully applied for training a neural network as closures for the extended EDMF, and improves its generalizability to global warming scenarios [^4]. We plan to apply this method using FNOs, which have been shown to be resolution agnostic in classical turbulent flow problems [^5], [blog-post](https://zongyi-li.github.io/blog/2020/fourier-pde/). As training data we run a library of Large Eddy Simulations (LES) driven by the conditions found in state of the art climate simulations at selected location on the glob [^6], [blog-post](https://clima.caltech.edu/2022/06/17/a-library-of-large-eddy-simulations-for-calibrating-cloud-parameterizations/).


### Code repositories and data libraries associated with the project

The code-base for carrying out this research is part of the CLiMA [model](https://github.com/CliMA). This code is distributed among a large number of packages, and several of these are interacting to provide a modeling and learning framework in this project. The algorithm starts with a current parameter set (green $\theta$) which is passed to the model to produce closures ($\varepsilon$, $\delta$). Using these closures the EDMF model computes profiles of observed variables which are used to compute a loss. The loss informs the inversion algorithm which predicts a better set of parameters (orange $\theta$) and so on until the loss value converges. 

Package                                     | Purpose
--------------------------------------------|--------------------------------------------------------
EnsembleKalmanProcesses.jl                  | Implementation of gradient-free optimization techniques
TurbulenceConvection.jl                     | Implementation of EDMF scheme of turbulence, convection and clouds
CalibrateEDMF.jl                            | Framework to learn about cloud processes from data
OperatorFlux.jl                             | A machine learning package for Fourier Neural Operators
LES library                                 | LES generated training data at current climate and 4K warming simulations

The interaction between these components is illustrated in the figure below, where `CalibrateEDMF.jl`
is the central package the communicate between the model `TurbulenceConvection.jl` the calibration algorithm `EnsembleKalmanProcesses.jl` and the data from the LES library. ![alt text](assets/dependency_diagram.pdf) 

- `CalibrateEDMF.jl` is a software package that leverages the Bayesian optimization techniques housed in `EnsembleKalmanProcesses.jl` to learn cloud process parameterizations within an eddy-diffusivity mass-flux scheme (EDMF) of atmospheric turbulence and convection, and quantify their uncertainty. You can access the repository [here](https://github.com/CliMA/CalibrateEDMF.jl), and the documentation [here](https://clima.github.io/CalibrateEDMF.jl/dev/).

- `TurbulenceConvection.jl` (TC) is a software package that implements the extended eddy-diffusivity mass-flux scheme (EDMF) of atmospheric turbulence and convection. The package also provides standalone drivers to simulate the lower troposphere on a single-column basis. You can access the repository [here](https://github.com/CliMA/TurbulenceConvection.jl). The [documentation](https://clima.github.io/TurbulenceConvection.jl/dev/) for this package is still under development.

- `OperatorFlux.jl` is a software package for FNOs. You can access the repository [here](https://github.com/CliMA/OperatorFlux.jl).


- The LES library use for training data is available here (https://data.caltech.edu/records/20052).

- `EnsembleKalmanProcesses.jl` (EKP) is a library of derivative-free Bayesian optimization techniques based on the Ensemble Kalman Filters, a well known family of approximate filters used for data assimilation. You can access the repository [here](https://github.com/CliMA/EnsembleKalmanProcesses.jl), and the documentation [here](https://clima.github.io/EnsembleKalmanProcesses.jl/dev/).


## References

[^1]: [Tan2018](@cite)
[^2]: [Cohen2020](@cite)
[^3]: [Lopez2020](@cite)
[^4]: [Lopez2022](@cite)
[^5]: [Li2020](@cite)
[^6]: [Shen2022](@cite)