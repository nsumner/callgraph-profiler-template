; ModuleID = '<stdin>'
source_filename = "c/09-internal-recursion.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @a(i32) #0 !dbg !6 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !10, metadata !11), !dbg !12
  call void @b(i32 %0), !dbg !13
  ret void, !dbg !14
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @b(i32) #0 !dbg !15 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !16, metadata !11), !dbg !17
  %2 = icmp sgt i32 %0, 0, !dbg !18
  br i1 %2, label %3, label %5, !dbg !20

; <label>:3:                                      ; preds = %1
  %4 = sub nsw i32 %0, 1, !dbg !21
  call void @a(i32 %4), !dbg !23
  br label %5, !dbg !24

; <label>:5:                                      ; preds = %3, %1
  ret void, !dbg !25
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !26 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !32, metadata !11), !dbg !33
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !34, metadata !11), !dbg !35
  call void @a(i32 %0), !dbg !36
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
!1 = !DIFile(filename: "c/09-internal-recursion.c", directory: "/home/nick/teaching/886/call-profiler/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "a", scope: !1, file: !1, line: 6, type: !7, isLocal: false, isDefinition: true, scopeLine: 6, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9}
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "i", arg: 1, scope: !6, file: !1, line: 6, type: !9)
!11 = !DIExpression()
!12 = !DILocation(line: 6, column: 7, scope: !6)
!13 = !DILocation(line: 7, column: 3, scope: !6)
!14 = !DILocation(line: 8, column: 1, scope: !6)
!15 = distinct !DISubprogram(name: "b", scope: !1, file: !1, line: 11, type: !7, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!16 = !DILocalVariable(name: "i", arg: 1, scope: !15, file: !1, line: 11, type: !9)
!17 = !DILocation(line: 11, column: 7, scope: !15)
!18 = !DILocation(line: 12, column: 9, scope: !19)
!19 = distinct !DILexicalBlock(scope: !15, file: !1, line: 12, column: 7)
!20 = !DILocation(line: 12, column: 7, scope: !15)
!21 = !DILocation(line: 13, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !1, line: 12, column: 14)
!23 = !DILocation(line: 13, column: 5, scope: !22)
!24 = !DILocation(line: 14, column: 3, scope: !22)
!25 = !DILocation(line: 15, column: 1, scope: !15)
!26 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 18, type: !27, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!9, !9, !29}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64, align: 64)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64, align: 64)
!31 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!32 = !DILocalVariable(name: "argc", arg: 1, scope: !26, file: !1, line: 18, type: !9)
!33 = !DILocation(line: 18, column: 10, scope: !26)
!34 = !DILocalVariable(name: "argv", arg: 2, scope: !26, file: !1, line: 18, type: !29)
!35 = !DILocation(line: 18, column: 23, scope: !26)
!36 = !DILocation(line: 19, column: 3, scope: !26)
!37 = !DILocation(line: 20, column: 3, scope: !26)
