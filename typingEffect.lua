-->> [Variables] <<--
local TypingEffect = {}
local visible = false

-->> [Local Functions] <<--

--> This function draw a typing effect.
local function drawText()
    if (#TypingEffect <= 0) then
        removeTypingEffect()
    end

    for i=1, #TypingEffect do
        local info = TypingEffect[i]
        local cTick = getTickCount()

        if (info.text and info.speed and info.tick) then
            if (info.endOnFinish and info.index >= utf8.len(info.text)) then
                return table.remove(TypingEffect, i)
            end

            if (cTick > info.tick) then
                info.tick = cTick + info.speed
                info.index = info.index + 1
                info.cText = utf8.sub(info.text, 1, info.index)
            end
            
            dxDrawText(info.cText or '', info.leftX, info.topY, info.rightX, info.bottomY, info.color, 1.00, info.font, info.alignX, info.alignY, false, true)
        end
    end
end

-->> [Global Functions] <<--

--> This function adds a new typing effect
function addTypingEffect(text, leftX, topY, rightX, bottomY, color, alignX, alignY, font, speed, endOnFinish)
    assert(type(text) == "string", "Bad argument 1 @ addTypingEffect (text expected, got "..type(text)..")")
    assert(type(leftX) == "number", "Bad argument 2 @ addTypingEffect (leftX expected, got "..type(leftX)..")")
    assert(type(topY) == "number", "Bad argument 3 @ addTypingEffect (topY expected, got "..type(topY)..")")

    if (not visible) then
        visible = not visible
        addEventHandler('onClientRender', root, drawText)
    end

    table.insert(TypingEffect, {
        text = text,
        leftX = leftX,
        topY = topY,
        rightX = rightX or 0,
        bottomY = bottomY or 0,
        color = color or tocolor(255, 255, 255),
        alignX = alignX or 'left',
        alignY = alignY or 'top',
        font = font or 'default',
        index = 0,
        tick = getTickCount(),
        speed = speed or 50,
        endOnFinish = endOnFinish or false
    })
    return true
end

--> This function clear all Typing Effects
function removeTypingEffect()
    if (visible) then
        visible = false
        TypingEffect = {}
        removeEventHandler('onClientRender', root, drawText)
        return true
    end

    return false
end
