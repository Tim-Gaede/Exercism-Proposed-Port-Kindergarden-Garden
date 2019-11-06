function plants(diagram::String, name::String)
    STUDENTS = ["Alice", "Bob", "Charlie", "David",
                "Eve", "Fred", "Ginny", "Harriet",
                "Ileana", "Joseph", "Kincaid", "Larry"]

    plants_from_diagram_and_index(diagram, indexOf(name, STUDENTS))
end


function plants(diagram::String, students::Array{String, 1}, name::String)
    plants_from_diagram_and_index(diagram, indexOf(name, sort(copy(students))))
end


function plants_from_diagram_and_index(diagram::String, i::Int)

    dgrm = split(diagram, "\n")
    REF = Dict('G' => "Grass", 'C' => "Clover",
               'R' => "Radishes", 'V' => "Violets")

    pl₁ = REF[dgrm[1][2i - 1]]
    pl₂ = REF[dgrm[1][2i]]
    pl₃ = REF[dgrm[2][2i - 1]]
    pl₄ = REF[dgrm[2][2i]]

    [pl₁, pl₂, pl₃, pl₄]
end

function indexOf(item, arr::Array)
    i = 1
    while i ≤ length(arr)
        if item == arr[i];    return i;    end
        i+=1
    end

    throw(ArgumentError("The item is not in the array."))
end
