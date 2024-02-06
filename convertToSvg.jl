function convert_pdf_to_svg(dir::String, regenerate::Bool=false)
    for (root, dirs, files) in walkdir(dir)
        for file in files
            if endswith(file, ".pdf")
                println()
                svg_file = replace(file, ".pdf" => ".svg")
                svg_path = joinpath(root, svg_file)
                if isfile(svg_path) && !regenerate
                    println("SVG file $svg_path already exists.")
                else
                    pdf_path = joinpath(root, file)
                    run(`pdf2svg $pdf_path $svg_path`)
                    println("Converted $pdf_path to $svg_path")
                end
                println()
            end
        end
    end
end

function main()
    regenerate = false
    if length(ARGS) > 0
        regenerate = ARGS[1] == "true"
    end
    convert_pdf_to_svg("./figures/tikz/", regenerate)
end

main()