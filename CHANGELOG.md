## [1.1.3](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.1.2...v1.1.3) (2023-11-19)


### Bug Fixes

* remove quay dockerhub secrets from robocop ([75d24b2](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/75d24b29459e422c95733a2a66e956790600a34b)), closes [#24](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/issues/24)

## [1.1.2](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.1.1...v1.1.2) (2023-11-18)


### Bug Fixes

* removing quay image pull secret ([5205101](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/5205101e72ddfd550534375f81ce0bf8fc83afa5))

## [1.1.1](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.1.0...v1.1.1) (2023-10-27)


### Bug Fixes

* update warning on postgresql statefulset auth configuration ([27a1bc5](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/27a1bc5f1612b466a9259a9d4afa7fbdd31203ad))

# [1.1.0](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.0.0...v1.1.0) (2023-10-27)


### Features

* add bitnami/postgresql chart dependency ([ab981a4](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/ab981a49e6f7813bd7965fd419a95781e8911546)), closes [#5](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/issues/5) [#16](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/issues/16)

# 1.0.0 (2023-10-26)


### Bug Fixes

* conditional build for merge on master with node build tool ([2f3dd2f](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/2f3dd2f92e69412751f4ccbad1921fceab80cbc9))
* helm lint workflow ([a4ae984](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/a4ae9844eef0746409960d9e9060c83f9e091901))
* move nodejs tool to pipeline (top level) ([46d5f02](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/46d5f026af35cf405262004ecb57a23346d5dc3a))
* remove password based authentication for github ([c45a951](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/c45a951973ba9201a2856c16dbee6aaec2196786))
* update PAT for GitHub-Jenkins CI ([238dc5c](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/238dc5ceb481cfbcd991aaf8b9f47e84119cec94))


### Features

* add helm templates to create and configure a working k8s cluster ([25f6d28](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/25f6d28788c1f0b7de991ffd7590807df9016f63)), closes [#1](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/issues/1)
* init helm chart ([0b470bf](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/0b470bf9299868b42fb796084a7b579fc431511d))
