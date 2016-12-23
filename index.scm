(repository
  (url "http://seth-misc.s3-website-us-east-1.amazonaws.com/index.scm")
  (name "incomplete or written while drunk")
  (sibling
    (name "Snow2 Repository")
    (url "http://snow2.s3-website-us-east-1.amazonaws.com/index.scm")
    (trust 1.0))
  (package
    (name (octree))
    (version "1.0")
    (url "octree.tgz")
    (size 10752)
    (checksum (md5 "904121c5b9ed7cb68d2ffa56b87b78fe"))
    (library
      (name (seth octree))
      (path "seth/octree.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "data structures for octrees")
      (license BSD-style)
      (depends (snow assert) (seth math-3d))
      (use-for final))
    (library
      (name (seth octree tests))
      (path "seth/octree/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for (seth octree)")
      (license BSD-style)
      (depends (seth octree))
      (use-for test)))
  (package
    (name (scad-model))
    (version "1.0")
    (url "scad-model.tgz")
    (size 16384)
    (checksum (md5 "d66f823fc6b9838bf9559d1087219041"))
    (library
      (name (seth scad-model))
      (path "seth/scad-model.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "write scad-models")
      (license BSD-style)
      (depends
        (srfi 13)
        (srfi 29)
        (srfi 69)
        (snow assert)
        (snow input-parse)
        (seth cout)
        (seth strings)
        (seth math-3d)
        (seth model-3d))
      (use-for final))
    (library
      (name (seth scad-model tests))
      (path "seth/scad-model/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for (seth scad-model)")
      (license BSD-style)
      (depends (seth scad-model))
      (use-for test)))
  (package
    (name (graph))
    (version "1.0")
    (url "graph.tgz")
    (size 7680)
    (checksum (md5 "80e846aa2100eab7672f1a811bfcc2e8"))
    (library
      (name (seth graph))
      (path "seth/graph.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "data structures for graphs")
      (license BSD-style)
      (depends (snow assert))
      (use-for final))
    (library
      (name (seth graph tests))
      (path "seth/graph/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for (seth graph)")
      (license BSD-style)
      (depends (seth graph))
      (use-for test)))
  (package
    (name (image))
    (version "1.0")
    (url "image.tgz")
    (size 31744)
    (checksum (md5 "7f3372761959b0323825bc90f5539819"))
    (library
      (name (seth image))
      (path "seth/image.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "image operations")
      (license BSD-style)
      (depends (seth raster))
      (use-for final))
    (library
      (name (seth image tests))
      (path "seth/image/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for (seth image)")
      (license BSD-style)
      (depends (seth cout) (seth raster) (seth image))
      (use-for test)))
  (package
    (name (raster))
    (version "1.0")
    (url "raster.tgz")
    (size 12800)
    (checksum (md5 "36adaf73003ee112caa2910c8fb23562"))
    (library
      (name (seth raster))
      (path "seth/raster.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "operations on data in a grid")
      (license BSD-style)
      (depends)
      (use-for final))
    (library
      (name (seth raster tests))
      (path "seth/raster/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for (seth raster)")
      (license BSD-style)
      (depends (seth cout) (seth raster))
      (use-for test)))
  (package
    (name (pbm))
    (version "1.0")
    (url "pbm.tgz")
    (size 13824)
    (checksum (md5 "c9b217180250e8bad005ba2dca8ab8d9"))
    (library
      (name (seth pbm))
      (path "seth/pbm.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "read and write netpbm files.")
      (license BSD-style)
      (depends (srfi 60) (seth cout) (seth raster) (seth image))
      (use-for final))
    (library
      (name (seth pbm tests))
      (path "seth/pbm/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for (seth pbm)")
      (license BSD-style)
      (depends (seth pbm))
      (use-for test)))
  (package
    (name (scheme-read))
    (version "1.0")
    (url "scheme-read.tgz")
    (size 68608)
    (checksum (md5 "ed4e34aa222eb6d0bbd57e2f54f09642"))
    (library
      (name (seth scheme-read))
      (path "seth/scheme-read.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "read scheme and keep track of whitespace.")
      (license BSD-style)
      (depends (seth flex) (seth port-extras))
      (use-for final))
    (library
      (name (seth-tests scheme-read tests))
      (path "seth-tests/scheme-read/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for (seth scheme-read)")
      (license BSD-style)
      (depends (seth scheme-read) (seth port-extras))
      (use-for test)))
  (package
    (name ())
    (version "1.0")
    (url "minecraft-nbt.tgz")
    (size 14848)
    (checksum (md5 "16beb58dfc66ca7b507061f9d172fda8"))
    (library
      (name (seth minecraft-nbt))
      (path "seth/minecraft-nbt.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual (else "http://minecraft.gamepedia.com/NBT_format"))
      (maintainers "Seth Alves <alves@hungry.com>")
      (authors "Seth Alves <alves@hungry.com>")
      (description "The Named Binary Tag format used by Minecraft")
      (license bsd)
      (depends (snow genport) (snow zlib) (snow assert) (weinholt struct pack))
      (use-for final))
    (library
      (name (seth minecraft-nbt tests))
      (path "seth/minecraft-nbt/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <alves@hungry.com>")
      (authors "Seth Alves <alves@hungry.com>")
      (description "tests for minecraft-nbt")
      (license bsd)
      (depends (snow extio) (seth minecraft-nbt))
      (use-for test)))
  (package
    (name (flex))
    (version "1.0")
    (url "flex.tgz")
    (size 17408)
    (checksum (md5 "8a6fd57cf8b0968a06a7a65c0b88898b"))
    (library
      (name (seth flex))
      (path "seth/flex.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "run a flex tokenizer in scheme")
      (license BSD-style)
      (depends)
      (use-for final))
    (library
      (name (seth-tests flex tests))
      (path "seth-tests/flex/tests.sld")
      (version "1.0")
      (homepage "https://github.com/sethalves")
      (manual)
      (maintainers "Seth Alves <seth@hungry.com>")
      (authors "Seth Alves <seth@hungry.com>")
      (description "tests for (seth flex)")
      (license BSD-style)
      (depends (seth flex) (seth port-extras))
      (use-for test))))
