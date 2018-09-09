# To build this container run:
#
# make RUBY="ruby verson" NAME="containername/..."

BRANCH := $(shell echo $(shell git symbolic-ref --short -q HEAD) | sed 's|/|\-|g' )
HASH   := $(shell git rev-parse --short HEAD)
TAG		 := ${BRANCH}-${HASH}
IMG    := ${NAME}:${TAG}-$(RUBY)

all: image push

image:
	echo "VERSION = '${TAG}'" > config/initializers/version.rb
	docker build -t ${IMG} -f Dockerfile-$(RUBY) .

push:
	docker push ${IMG}
