; ModuleID = '<stdin>'
source_filename = "c/08-function-pointer-multiple-internal-targets.c"
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
define void @c(i32) #0 !dbg !18 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !19, metadata !11), !dbg !20
  ret void, !dbg !21
}

; Function Attrs: nounwind uwtable
define void @d(i32) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !23, metadata !11), !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind uwtable
define void @dispatcher(void (i32)*) #0 !dbg !26 {
  call void @llvm.dbg.value(metadata void (i32)* %0, i64 0, metadata !30, metadata !11), !dbg !31
  call void %0(i32 1), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !34 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !40, metadata !11), !dbg !41
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !42, metadata !11), !dbg !43
  call void @dispatcher(void (i32)* @a), !dbg !44
  call void @dispatcher(void (i32)* @b), !dbg !45
  call void @dispatcher(void (i32)* @c), !dbg !46
  call void @dispatcher(void (i32)* @d), !dbg !47
  ret i32 0, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "c/08-function-pointer-multiple-internal-targets.c", directory: "/home/nick/teaching/886/call-profiler/test")
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
!18 = distinct !DISubprogram(name: "c", scope: !1, file: !1, line: 7, type: !7, isLocal: false, isDefinition: true, scopeLine: 7, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!19 = !DILocalVariable(name: "i", arg: 1, scope: !18, file: !1, line: 7, type: !9)
!20 = !DILocation(line: 7, column: 12, scope: !18)
!21 = !DILocation(line: 7, column: 16, scope: !18)
!22 = distinct !DISubprogram(name: "d", scope: !1, file: !1, line: 9, type: !7, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!23 = !DILocalVariable(name: "i", arg: 1, scope: !22, file: !1, line: 9, type: !9)
!24 = !DILocation(line: 9, column: 12, scope: !22)
!25 = !DILocation(line: 9, column: 16, scope: !22)
!26 = distinct !DISubprogram(name: "dispatcher", scope: !1, file: !1, line: 11, type: !27, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !29}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!30 = !DILocalVariable(name: "funptr", arg: 1, scope: !26, file: !1, line: 11, type: !29)
!31 = !DILocation(line: 11, column: 24, scope: !26)
!32 = !DILocation(line: 11, column: 40, scope: !26)
!33 = !DILocation(line: 11, column: 51, scope: !26)
!34 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 14, type: !35, isLocal: false, isDefinition: true, scopeLine: 14, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!9, !9, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64, align: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64, align: 64)
!39 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!40 = !DILocalVariable(name: "argc", arg: 1, scope: !34, file: !1, line: 14, type: !9)
!41 = !DILocation(line: 14, column: 10, scope: !34)
!42 = !DILocalVariable(name: "argv", arg: 2, scope: !34, file: !1, line: 14, type: !37)
!43 = !DILocation(line: 14, column: 23, scope: !34)
!44 = !DILocation(line: 15, column: 3, scope: !34)
!45 = !DILocation(line: 16, column: 3, scope: !34)
!46 = !DILocation(line: 17, column: 3, scope: !34)
!47 = !DILocation(line: 18, column: 3, scope: !34)
!48 = !DILocation(line: 31, column: 3, scope: !34)
