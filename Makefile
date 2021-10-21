.PHONY: configs src resources

# init (config [$1])
# ${call init, ./configs/canvas2d/pixi-gsap-spine-ts.json}
define init
	rm -f ./package.json
	cp $(1) ./package.json
	@rm -rf /node_modules && npm install -S -D
endef

# touch src/index{.js,.ts}
init:
	@echo 'Initializing src directory with empty files'
	cp ./resources/templates/empty.js ./src/index.js
	cp ./resources/templates/empty.js ./src/index.ts

pixi-ts-gsap:
	@echo 'Sandbox with: PIXI.JS + Typescript + GSAP (Testing WebGL features)'
	@touch ./src/index.ts
	@${call init, ./configs/ts-pixi-gsap.json}

pixi-ts-gsap-spine:
	@echo 'Sandbox with: PIXI.JS + Typescript + GSAP + Spine (Testing WebGL features)'
	@touch ./src/index.ts
	@${call init, ./configs/ts-pixi-gsap-spine.json}

js:
	@echo 'Sandbox with: Vanilla Javascript + Decimal (initialized, please wait)'
	@touch ./src/index.js
	@${call init, ./configs/js-decimal.json}

ts:
	@echo 'Sandbox with: Typescript + Decimal (initialized, please wait)'
	@touch ./src/index.ts
	@${call init, ./configs/ts-decimal.json}