; ModuleID = '<stdin>'
source_filename = "c/07-function-pointer-one-internal-target.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @a(i32) #0 !dbg !6 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !10, metadata !11), !dbg !12
  ret void, !dbg !13
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @b(i32) #0 !dbg !14 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !15, metadata !11), !dbg !16
  ret void, !dbg !17
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !18 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !24, metadata !11), !dbg !25
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !26, metadata !11), !dbg !27
  %3 = and i32 %0, 1, !dbg !28
  %4 = icmp ne i32 %3, 0, !dbg !28
  br i1 %4, label %5, label %6, !dbg !30

; <label>:5:                                      ; preds = %2
  call void @llvm.dbg.value(metadata void (i32)* @a, i64 0, metadata !31, metadata !11), !dbg !33
  br label %7, !dbg !34

; <label>:6:                                      ; preds = %2
  call void @llvm.dbg.value(metadata void (i32)* @b, i64 0, metadata !31, metadata !11), !dbg !33
  br label %7

; <label>:7:                                      ; preds = %6, %5
  %.0 = phi void (i32)* [ @a, %5 ], [ @b, %6 ]
  call void %.0(i32 1), !dbg !36
  ret i32 0, !dbg !37
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "c/07-function-pointer-one-internal-target.c", directory: "/home/nick/teaching/886/call-profiler/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "a", scope: !1, file: !1, line: 3, type: !7, isLocal: false, isDefinition: true, scopeLine: 3, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9}
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "i", arg: 1, scope: !6, file: !1, line: 3, type: !9)
!11 = !DIExpression()
!12 = !DILocation(line: 3, column: 12, scope: !6)
!13 = !DILocation(line: 3, column: 16, scope: !6)
!14 = distinct !DISubprogram(name: "b", scope: !1, file: !1, line: 5, type: !7, isLocal: false, isDefinition: true, scopeLine: 5, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!15 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !1, line: 5, type: !9)
!16 = !DILocation(line: 5, column: 12, scope: !14)
!17 = !DILocation(line: 5, column: 16, scope: !14)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !19, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!9, !9, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64, align: 64)
!23 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!24 = !DILocalVariable(name: "argc", arg: 1, scope: !18, file: !1, line: 8, type: !9)
!25 = !DILocation(line: 8, column: 10, scope: !18)
!26 = !DILocalVariable(name: "argv", arg: 2, scope: !18, file: !1, line: 8, type: !21)
!27 = !DILocation(line: 8, column: 23, scope: !18)
!28 = !DILocation(line: 10, column: 12, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !1, line: 10, column: 7)
!30 = !DILocation(line: 10, column: 7, scope: !18)
!31 = !DILocalVariable(name: "funptr", scope: !18, file: !1, line: 9, type: !32)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!33 = !DILocation(line: 9, column: 10, scope: !18)
!34 = !DILocation(line: 12, column: 3, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 10, column: 17)
!36 = !DILocation(line: 15, column: 3, scope: !18)
!37 = !DILocation(line: 16, column: 3, scope: !18)
