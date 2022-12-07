*** Settings ***
Documentation      A Test Case For Making First Purchasement
Resource           ../../Resources/purchaseProduct.robot

# Execute Before Test Case
Test Setup         purchaseProduct.Open Application
# Execute After Test Case
Test Teardown      purchaseProduct.Close Application

*** Test Cases ***
Login Existing Account & Made First Purchase
    purchaseProduct.Direct to Login Page
    purchaseProduct.Verify Login Page
    purchaseProduct.Login With Registered Email And Password
    purchaseProduct.Verify Profile Page
    purchaseProduct.Go To Marketplace
    purchaseProduct.Select Product
    purchaseProduct.Verify Product And Add To Cart
    purchaseProduct.Go To Checkout Cart
    purchaseProduct.Redirect To Add Address Page
    purchaseProduct.Adding New Address
    purchaseProduct.Product Checkout
    purchaseProduct.Redirect To Payment Success Page