.PHONY: serve build clean

# Live preview at http://localhost:1313 (includes draft and future-dated posts).
serve:
	hugo server -D -F

# Production build into ./public
build:
	hugo --minify

# Remove build output
clean:
	rm -rf public resources/_gen
