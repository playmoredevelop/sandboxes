.PHONY: configs src resources

# init (config [$1])
# ${call init, ./configs/canvas2d/pixi-gsap-spine-ts.json}
define init
	rm ./package.json
	cp $(1) ./package.json
	@rm -rf /node_modules && npm install -S -D
endef

pixi-ts-gsap-spine:
	@echo 'Sandbox with: PIXI.JS + Typescript + GSAP + Spine (Testing WebGL features)'
	@touch ./src/index.ts
	@${call init, ./configs/pixi/ts-gsap-spine.json}

pixi-ts-gsap-dragonbones:
	@echo 'Sandbox with: PIXI.JS + Typescript + GSAP + DragonBones (Testing WebGL features)'
	@touch ./src/index.ts
	@${call init, ./configs/pixi/ts-gsap-dragonbones.json}

js:
	@echo 'Sandbox with: Vanilla Javascript + Decimal (initialized, please wait)'
	@touch ./src/index.js
	@${call init, ./configs/javascript/js-math.json}