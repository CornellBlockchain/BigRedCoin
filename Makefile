MODULES=p2p block transaction messages_types messages_pb
OBJECTS=$(MODULES:=.cmo)
MLS=$(MODULES:=.ml)
MLIS=$(MODULES:=.mli)
MAIN=p2p.byte
OCAMLBUILD=ocamlbuild -use-ocamlfind
PKGS=lwt ocaml-protoc

default: build
	utop

build:
	$(OCAMLBUILD) $(OBJECTS)

run:
	$(OCAMLBUILD) $(MAIN) && ./$(MAIN)

clean:
	ocamlbuild -clean