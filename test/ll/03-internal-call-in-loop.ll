; ModuleID = '<stdin>'
source_filename = "c/03-internal-call-in-loop.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @a() #0 !dbg !6 {
  ret void, !dbg !9
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !10 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !17, metadata !18), !dbg !19
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !20, metadata !18), !dbg !21
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !22, metadata !18), !dbg !25
  br label %3, !dbg !26

; <label>:3:                                      ; preds = %6, %2
  %.0 = phi i32 [ 0, %2 ], [ %7, %6 ]
  %4 = icmp ult i32 %.0, 10, !dbg !27
  br i1 %4, label %5, label %8, !dbg !30

; <label>:5:                                      ; preds = %3
  call void @a(), !dbg !31
  br label %6, !dbg !33

; <label>:6:                                      ; preds = %5
  %7 = add i32 %.0, 1, !dbg !34
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !22, metadata !18), !dbg !25
  br label %3, !dbg !36, !llvm.loop !37

; <label>:8:                                      ; preds = %3
  ret i32 0, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "c/03-internal-call-in-loop.c", directory: "/home/nick/teaching/886/call-profiler/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "a", scope: !1, file: !1, line: 3, type: !7, isLocal: false, isDefinition: true, scopeLine: 3, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !DILocation(line: 3, column: 11, scope: !6)
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !11, isLocal: false, isDefinition: true, scopeLine: 6, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64, align: 64)
!16 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "argc", arg: 1, scope: !10, file: !1, line: 6, type: !13)
!18 = !DIExpression()
!19 = !DILocation(line: 6, column: 10, scope: !10)
!20 = !DILocalVariable(name: "argv", arg: 2, scope: !10, file: !1, line: 6, type: !14)
!21 = !DILocation(line: 6, column: 23, scope: !10)
!22 = !DILocalVariable(name: "i", scope: !23, file: !1, line: 7, type: !24)
!23 = distinct !DILexicalBlock(scope: !10, file: !1, line: 7, column: 3)
!24 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 7, column: 17, scope: !23)
!26 = !DILocation(line: 7, column: 8, scope: !23)
!27 = !DILocation(line: 7, column: 26, scope: !28)
!28 = !DILexicalBlockFile(scope: !29, file: !1, discriminator: 1)
!29 = distinct !DILexicalBlock(scope: !23, file: !1, line: 7, column: 3)
!30 = !DILocation(line: 7, column: 3, scope: !28)
!31 = !DILocation(line: 8, column: 5, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !1, line: 7, column: 37)
!33 = !DILocation(line: 9, column: 3, scope: !32)
!34 = !DILocation(line: 7, column: 32, scope: !35)
!35 = !DILexicalBlockFile(scope: !29, file: !1, discriminator: 2)
!36 = !DILocation(line: 7, column: 3, scope: !35)
!37 = distinct !{!37, !38}
!38 = !DILocation(line: 7, column: 3, scope: !10)
!39 = !DILocation(line: 10, column: 3, scope: !10)
