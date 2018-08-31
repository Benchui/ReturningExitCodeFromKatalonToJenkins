import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

WebUI.openBrowser('')

WebUI.navigateToUrl('https://katalon-demo-cura.herokuapp.com/')

WebUI.verifyElementPresent(
	findTestObject('Object Repository/Page_CURA Healthcare Service/h3_We Care About Your Money'),
	5, FailureHandling.CONTINUE_ON_FAILURE)

WebUI.closeBrowser()
