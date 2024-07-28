/*
    SPDX-FileCopyrightText: 2016 David Edmundson <davidedmundson@kde.org>
    SPDX-FileCopyrightText: 2022 Aleix Pol Gonzalez <aleixpol@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.kirigami 2.20 as Kirigami

PlasmaComponents.ToolButton {
    id: root

    icon.name: "distributor-logo-nixos"

    checkable: true
    checked: popup.visible
    onToggled: {
        if (checked) {
            popup.open()
        } else {
            popup.close()
        }
    }

    signal sessionChanged()

    Popup {
        id: popup

        modal: true
        focus: true

        y: root.y + root.height + 4

        ColumnLayout {
            Button {
                id: virtualKeyboardButton

                text: i18ndc("plasma-desktop-sddm-theme", "Button to show/hide virtual keyboard", "Virtual Keyboard")
                icon.name: inputPanel.keyboardActive ? "input-keyboard-virtual-on" : "input-keyboard-virtual-off"
                onClicked: {
                    userListComponent.mainPasswordBox.forceActiveFocus();
                    inputPanel.showHide()
                }
                visible: inputPanel.status === Loader.Ready

                Layout.fillWidth: true
                Layout.fillHeight: true
                containmentMask: Item {
                    parent: virtualKeyboardButton
                    anchors.fill: parent
                    anchors.leftMargin: -header.anchors.margins // Changed from footer to header
                    anchors.topMargin: -header.anchors.margins // Changed from bottom to top
                }
            }
            SessionButton {
                id: sessionButton

                onSessionChanged: {
                    userListComponent.mainPasswordBox.forceActiveFocus();
                }

                Layout.fillWidth: true
                Layout.fillHeight: true
                containmentMask: Item {
                    parent: sessionButton
                    anchors.fill: parent
                    anchors.leftMargin: virtualKeyboardButton.visible || keyboardButton.visible
                    ? 0 : -header.anchors.margins // Changed from footer to header
                    anchors.topMargin: -header.anchors.margins // Changed from bottom to top
                }
            }
            RowLayout {
                ActionButton {
                    icon.name: "system-suspend"
                    text: i18ndc("plasma-desktop-sddm-theme", "Suspend to RAM", "Sleep")
                    onClicked: sddm.suspend()
                    enabled: sddm.canSuspend
                }
                ActionButton {
                    icon.name: "system-reboot"
                    text: i18nd("plasma-desktop-sddm-theme", "Restart")
                    onClicked: sddm.reboot()
                    enabled: sddm.canReboot
                }
                ActionButton {
                    icon.name: "system-shutdown"
                    text: i18nd("plasma-desktop-sddm-theme", "Shut Down")
                    onClicked: sddm.powerOff()
                    enabled: sddm.canPowerOff
                }
            }
        }
    }

}
