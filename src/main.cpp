/***********************************************************************
 * Project      :     tenergy32gateway_template
 * Description  :     Test program for Tenergy32 Gateway board
 * Hardware     :     Tenergy32GateWay
 * Author       :     Tenergy Innovation Co., Ltd.
 * Date         :     27/04/2025
 ***********************************************************************/
#include <Arduino.h>
#include <tenergy32gateway.h>
#include <esp_task_wdt.h>
#include <esp_system.h> // สำหรับ esp_read_mac

Tenergy32GateWay mcu;

// ตัวแปรสำหรับเก็บชื่อ unitName
String unitName = "";

/***********************************************************************
 * FUNCTION:    getUnitNameFromMac
 * DESCRIPTION: สร้างชื่อ unitName จาก MAC Address (6 ตัวหลัง)
 * RETURNED:    String ชื่อบอร์ด tenergy32gateway-xxxxxx
 ***********************************************************************/
String getUnitNameFromMac()
{
    uint8_t mac[6];
    esp_read_mac(mac, ESP_MAC_WIFI_STA);
    char macStr[7];
    snprintf(macStr, sizeof(macStr), "%02X%02X%02X", mac[3], mac[4], mac[5]);
    return "tenergy32gateway-" + String(macStr);
}

void header_print(void)
{
    Serial.printf("\r\n***********************************************************************\r\n");
    Serial.printf("* Project      :     tenergy32gateway_template\r\n");
    Serial.printf("* Description  :     Template coding for Tenergy32GateWay on PlatformIO\r\n");
    Serial.printf("* Hardware     :     Tenergy32GateWay\r\n");
    Serial.printf("* Author       :     Tenergy Innovation Co., Ltd.\r\n");
    Serial.printf("* Date         :     27/04/2025\r\n");
    Serial.printf("* Revision     :     %s\r\n", mcu._version.c_str());
    Serial.printf("* website      :     http://www.tenergyinnovation.co.th\r\n");
    Serial.printf("* Email        :     uten.boonliam@tenergyinnovation.co.th\r\n");
    Serial.printf("* TEL          :     +66 89-140-7205\r\n");
    Serial.printf("***********************************************************************/\r\n");
}

void setup()
{
    Serial.begin(115200);
    header_print();

    // Initialize watchdog timer
    esp_task_wdt_init(10, true);
    esp_task_wdt_add(NULL);

    if (!mcu.begin())
    {
        Serial.println("Board initialization failed!");
        while (1)
            ;
    }

    // Delay to view initial info
    delay(1000);

    // สร้าง unitName จาก MAC Address
    unitName = getUnitNameFromMac();

    // แสดงชื่อ unitName บน Serial และ OLED
    Serial.printf("unitName: %s\r\n", unitName.c_str());
    mcu.displayOLED(unitName.c_str());
}

void loop()
{
    esp_task_wdt_reset();
    delay(1000);
}
