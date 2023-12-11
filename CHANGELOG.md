## [1.8.3](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.8.2...v1.8.3) (2023-12-11)


### Bug Fixes

* adding Internal Ip to webapp service ([c7c0e24](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/c7c0e24450b03187df5dde7bd9c7b2b9922eeb21))

## [1.8.2](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.8.1...v1.8.2) (2023-12-09)


### Bug Fixes

* install latest image by default ([2c7f776](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/2c7f776f0ba3b481bb08f530247a2aacbd6a50cc))

## [1.8.1](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.8.0...v1.8.1) (2023-12-08)


### Bug Fixes

* update replicaCount and resource request and limits for pods in ([68b79f3](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/68b79f3799b07df6fb5cfa6cefd06556f3420395))

# [1.8.0](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.7.1...v1.8.0) (2023-12-08)


### Bug Fixes

* change n/w topology for pod anti-affinity ([8567f72](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/8567f724556ac45b65232380914cab5af421eb83))


### Features

* add Istio Service Mesh Gateway & Virtual Service ([390cb72](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/390cb72818fa27e621079a5810a325d1281671ee))

## [1.7.1](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.7.0...v1.7.1) (2023-12-01)


### Bug Fixes

* adding namespace in limit range resource ([b72ff92](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/b72ff9218ffb86cb1d2f11f4c7b800a6253833ad))

# [1.7.0](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.6.0...v1.7.0) (2023-12-01)


### Features

* add resource limits ([7d50084](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/7d5008499655b6f37a156f6cb7ffa535e8a5a0cd))

# [1.6.0](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.5.0...v1.6.0) (2023-11-29)


### Features

* Adding network policy for webapp-db ([21ee5d8](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/21ee5d8485ee92d03345280700e5f992a1182645))

# [1.5.0](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.4.0...v1.5.0) (2023-11-23)


### Features

* adding pod anti affinity ([4ecb918](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/4ecb91869ef7653b648ef073eca91e22b3d08b3c))

# [1.4.0](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.3.0...v1.4.0) (2023-11-23)


### Features

* adding HPA for deployment ([a3cbedb](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/a3cbedbc70a95cc4192d2035b72105c822793b94))

# [1.3.0](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.2.1...v1.3.0) (2023-11-22)


### Bug Fixes

* remove hardocded vars for image ([576e402](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/576e4027b0053a22cd112001d87e1f9c1a2f38ea))


### Features

* update image specs as parts ([6859df6](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/6859df634021e28dfbde4f4256037408666ed560)), closes [#30](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/issues/30)

## [1.2.1](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.2.0...v1.2.1) (2023-11-20)


### Bug Fixes

* downgrade psql to v15 ([5ca294d](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/5ca294de4c1a4a89ef22d3162ec43492bb65238a)), closes [#28](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/issues/28)

# [1.2.0](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/compare/v1.1.3...v1.2.0) (2023-11-20)


### Features

* add rbac cluster roles ([edc9862](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/commit/edc98621184b94cf8c875f87ce4c420a16d7d57c)), closes [#26](https://github.com/csye7125-fall2023-group05/webapp-helm-chart/issues/26)

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
