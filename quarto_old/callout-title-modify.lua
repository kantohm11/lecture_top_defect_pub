-- Create a file named 'modify-callout-title.lua' with the following content:

function Callout(node)
    -- Ensure there's a title to modify
    if node.title and #node.title > 0 then
        -- Wrap the existing title in a \textsf command
        -- The title is expected to be a list of Inline elements,
        -- so we'll create a RawInline element for the opening and closing commands,
        -- and insert them at the beginning and end of the title list, respectively
        table.insert(node.title, 1, pandoc.RawInline('latex', '\\textsf{'))
        table.insert(node.title, pandoc.RawInline('latex', '}'))
    end
    return node  -- Return the modified node
end