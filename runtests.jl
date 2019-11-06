using Test

include("kindergarden_garden.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v1.1.1


println("\n"^2, "-"^60, "\n"^3)

@testset "Partial garden garden with single student." begin
    @test plants("RC\nGG", "Alice") == ["Radishes", "Clover", "Grass", "Grass"]
end
println()

@testset "Partial garden different garden with single student." begin
    @test plants("VC\nRC", "Alice") == ["Violets", "Clover",
                                        "Radishes", "Clover"]
end
println()


@testset "Partial garden garden with two students." begin
    @test plants("VVCG\nVVRC", "Bob") == ["Clover", "Grass",
                                          "Radishes", "Clover"]
end
println()


@testset "Partial garden second student's garden." begin
    @test plants("VVCCGG\nVVCCGG", "Bob") == ["Clover", "Clover",
                                              "Clover", "Clover"]
end
println()

@testset "Partial garden third student's garden." begin
    @test plants("VVCCGG\nVVCCGG", "Charlie") == ["Grass", "Grass",
                                                  "Grass", "Grass"]
end
println()

@testset "Full garden first student's garden." begin
    diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
    @test plants(diagram, "Alice") == ["Violets", "Radishes",
                                       "Violets", "Radishes"]
end
println()


@testset "Full garden second student's garden." begin
    diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
    @test plants(diagram, "Bob") == ["Clover", "Grass", "Clover", "Clover"]
end
println()

@testset "Full garden second to last student's garden." begin
    diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
    @test plants(diagram, "Kincaid") == ["Grass", "Clover", "Clover", "Grass"]
end
println()


@testset "Full garden last student's garden." begin
    diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
    @test plants(diagram, "Larry") == ["Grass", "Violets", "Clover", "Violets"]
end
println()


# Additional tests for this track

@testset "Students are unordered first student." begin
    diagram = "VCRRGVRG\nRVGCCGCV"
    students = ["Samantha", "Patricia", "Xander", "Roger"]
    @test plants(diagram, students, "Patricia") == ["Violets", "Clover",
                                                    "Radishes", "Violets"]
end
println()


@testset "Students are unordered last student." begin
    diagram = "VCRRGVRG\nRVGCCGCV"
    students=["Samantha", "Patricia", "Xander", "Roger"]
    @test plants(diagram, students, "Xander") == ["Radishes", "Grass",
                                                "Clover", "Violets"]
end
println()
