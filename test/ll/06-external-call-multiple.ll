; ModuleID = '<stdin>'
source_filename = "c/06-external-call-multiple.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Inside %s() at %s:%u\0A\00", align 1
@__FUNCTION__.a = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"c/06-external-call-multiple.c\00", align 1

; Function Attrs: nounwind uwtable
define void @a() #0 !dbg !6 {
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @__FUNCTION__.a, i32 0, i32 0), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i32 0, i32 0), i32 4), !dbg !9
  ret void, !dbg !10
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 !dbg !11 {
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !18, metadata !19), !dbg !20
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !21, metadata !19), !dbg !22
  call void @a(), !dbg !23
  call void @a(), !dbg !24
  call void @a(), !dbg !25
  ret i32 0, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "c/06-external-call-multiple.c", directory: "/home/nick/teaching/886/call-profiler/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!6 = distinct !DISubprogram(name: "a", scope: !1, file: !1, line: 3, type: !7, isLocal: false, isDefinition: true, scopeLine: 3, isOptimized: false, unit: !0, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !DILocation(line: 4, column: 3, scope: !6)
!10 = !DILocation(line: 5, column: 1, scope: !6)
!11 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !12, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!14, !14, !15}
!14 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64, align: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64, align: 64)
!17 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!18 = !DILocalVariable(name: "argc", arg: 1, scope: !11, file: !1, line: 8, type: !14)
!19 = !DIExpression()
!20 = !DILocation(line: 8, column: 10, scope: !11)
!21 = !DILocalVariable(name: "argv", arg: 2, scope: !11, file: !1, line: 8, type: !15)
!22 = !DILocation(line: 8, column: 23, scope: !11)
!23 = !DILocation(line: 9, column: 3, scope: !11)
!24 = !DILocation(line: 10, column: 3, scope: !11)
!25 = !DILocation(line: 11, column: 3, scope: !11)
!26 = !DILocation(line: 12, column: 3, scope: !11)
