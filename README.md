
# mta-lua-typing-effect

This code allows you to create a typing effect.

## Functions

- This function adds a new typing effect
```bash
 bool addTypingEffect(string text, float leftX, float topY [, float rightX, float bottomY,  int color = white, string alignX = "left", string alignY = "top", mixed font = "default", int speed = 50, bool endOnFinish = false)
```
- This function clear all Typing Effects
```bash
 bool removeTypingEffect()
```

## Parameters

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `text` | `string` | **Required**. the text to draw. |
| `leftX` | `float` | **Required**. the absolute X coordinate of the top left corner of the text. |
| `topY` | `float` | **Required**. the absolute Y coordinate of the top left corner of the text. |
| `rightX` | `float` | **Optional**. the absolute X coordinate of the right side of the text bounding box. Used for text aligning, clipping and word breaking. |
| `bottomY` | `float` | **Optional**. the absolute Y coordinate of the bottom side of the text bounding box. Used for text aligning, clipping and word breaking. |
| `color` | `int` | **Optional**. the color of the text, a value produced by tocolor or 0xAARRGGBB (AA = alpha, RR = red, GG = green, BB = blue). |
| `alignX` | `string` | **Optional**. horizontal alignment of the text within the bounding box. Can be "left", "center" or "right". |
| `alignY` | `string` | **Optional**. vertical alignment of the text within the bounding box. Can be "top", "center" or "bottom". |
| `font` | `mixed font` | **Optional**. Either a custom DX font element or the name of a built-in DX font. |
| `speed` | `int` | **Optional**. Speed of effect in milliseconds. |
| `endOnFinish` | `bool` | **Optional**. When activated, the message will disappear when it has finished being written. |

## How to Use

```lua
addTypingEffect('Only one test message!', 0, 0, 500, 20, tocolor(255, 255, 255), 'center', 'center', 'arial', 100, false)
```
