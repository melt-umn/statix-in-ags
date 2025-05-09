open Ocaml_ag_syntax
open Ocaml_ag_lm_spec

let one_import: term =
  TermT("Program", [
    TermE(TermT("DeclsCons", [
      TermE(TermT("DeclModule", [
        String("A");
        TermE(TermT("DeclsCons", [
          TermE(TermT("DeclDef", [TermE(TermT("DefBindPar", [String("x"); TermE(TermT("ExprInt", [Int(1)]))]))]));
          TermE(TermT("DeclsNil", []))
        ]))
      ]));
      TermE(TermT("DeclsCons", [
        TermE(TermT("DeclModule", [
          String("B");
          TermE(TermT("DeclsCons", [
            TermE(TermT("DeclImport", [
              TermE(TermT("ModRef", [
                String("A")
              ]))
            ]));
            TermE(TermT("DeclsCons", [
              TermE(TermT("DeclDef", [
                TermE(TermT("DefBindPar", [
                  String("y");
                  TermE(TermT("ExprVar", [
                    TermE(TermT("VarRef", [
                      String("x")
                    ]))
                  ]))
                ]))
              ]));
              TermE(TermT("DeclsNil", []))
            ]))
          ]))
        ]));
        TermE(TermT("DeclsNil", []))
      ]))
    ]))
  ])

let () = assert(AG_Full.okTrueState one_import)