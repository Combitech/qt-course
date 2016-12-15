import QtQuick 2.4

Rectangle {
    anchors.fill: parent
    color: "#DDD"

    Column {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        spacing: 50

        Text {
            font.pointSize: 50
            font.underline: true
            text: "TextInput"
        }

        Rectangle {
            width: parent.width
            height: 100

            //if textInput is focused: alternative 1, else alt. 2
            border.color: textInput.focus ? "green" : "black"
            border.width: textInput.focus ? 4 : 2


            TextInput {
                id: textInput
                anchors.margins: 4
                onEditingFinished: focus = false
                anchors.fill: parent
                font.pointSize: 50
                verticalAlignment: Text.AlignVCenter
                clip: true
                text: "Nisse"

                // Gain focus on mouse press
                //activeFocusOnPress: false     // default = true

                /* Should the text auto scroll if the paintedWidth of
                * the text is longer than TextInput width
                */
                autoScroll: true

                // ReadOnly:
                /*  Tells if the content in the clipboard is suitable
                *   for the item
                */
                //canPaste: true
                //canRedo: true
                //canUndo: true

                // You can implement your own cursor by adding
                // a cursorDelegate item

                /*cursorDelegate: Rectangle {
                    id: cursorItem
                    height: textInput.font.pointSize
                    widthTextInput: 3
                    color: "purple"
                    visible: cursorShowing && textInput.focus

                    property bool cursorShowing: false

                    Timer {
                        interval: 250
                        repeat: true
                        running: textInput.focus
                        onTriggered: cursorItem.visible = !cursorItem.visible
                    }
                }*/


                //inputMask:

                //echoMode: TextInput.Normal  //Default
                //echoMode: TextInput.Password
                //echoMode: TextInput.NoEcho

                // Displays characters as they are entered while editing, when enter is pressed it looks like a password
                //echoMode: TextInput.PasswordEchoOnEdit




                /* Provides hints to the input method about the expected content
                *  of the text input and how it should operate.
                *  Perfect for telling the input which keyboard to show when
                *  focus is gained
                */
                inputMethodHints: Qt.ImhNone
                //inputMethodHints: Qt.ImhPreferNumbers
                //inputMethodHints: Qt.ImhPreferUppercase
                //inputMethodHints: Qt.ImhPreferLowercase
                //inputMethodHints: Qt.ImhDigitsOnly
                //inputMethodHints: Qt.ImhEmailCharactersOnly

                //  TEXT SELECTION

                // Do you allow the user to select text
                selectByMouse: true
                //mouseSelectionMode: TextInput.SelectCharacters    // default

                // Select word on double click, all characters on tripleclick
                mouseSelectionMode: TextInput.SelectWords

                // Which color to indicate selected text
                //selectedTextColor: "pink"

                // Background color for selected text
                //selectionColor: "pink"
            }

        }

        Column {
            width: parent.width
            spacing: 10
            Text {
                font.pointSize: 25
                text: "<b>canPaste:</b> " + textInput.canPaste
            }
            Text {
                font.pointSize: 25
                text: "<b>canRedo:</b> " + textInput.canRedo
            }
            Text {
                font.pointSize: 25
                text: "<b>canUndo:</b> " + textInput.canUndo
            }
            Text {
                font.pointSize: 25
                text: "<b>cursorVisible:</b> " + textInput.cursorVisible
            }
            Text {
                font.pointSize: 25
                text: "<b>length:</b> " + textInput.length
            }
            Text {
                font.pointSize: 25
                text: "<b>selectedText:</b> " + textInput.selectedText
            }
            Text {
                font.pointSize: 25
                text: "<b>selected Start-End:</b> " + textInput.selectionStart + " - " + textInput.selectionEnd
            }
        }
    }
}
