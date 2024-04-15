import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/asset_constants.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:MoboPex/src/view/ui/screens/navigation/notification/notification_page.dart';
import 'package:MoboPex/src/view/ui/screens/navigation/profile/bank_account_page.dart';
import 'package:MoboPex/src/view/ui/screens/navigation/profile/edit_profile.dart';
import 'package:MoboPex/src/view/ui/screens/navigation/profile/shipping_address_page.dart';
import 'package:MoboPex/src/view/ui/widgets/navigator/base_navigator.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseNavigator(
      builder: (navKey)=>Scaffold(
        appBar: AppBar(
          leading: BackButton(), // Use your own custom back button if needed
          title: Text('My Profile'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(AssetConstants.profilePicture), // Replace with your image URL or local asset
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Shib',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    _buildProfileOption(context, Icons.edit, 'Edit Profile' ,onTapProfileOption: (){
                      navKey.currentState?.push(MaterialPageRoute(builder: (_) =>EditProfilePage(navKey: navKey,) ));
                    } ),
                    SizedBox(height: 16),
                    _buildProfileOption(context, Icons.location_on, 'Shipping Address', onTapProfileOption: () {
                      navKey.currentState?.push(MaterialPageRoute(builder: (_)=> ShippingAddressPage(hasAddress: true , navKey: navKey))) ;
                    }),
                    SizedBox(height: 16),
                    _buildProfileOption(context, Icons.favorite_border, 'Wishlist', onTapProfileOption: () {  }),
                    SizedBox(height: 16),
                    _buildProfileOption(context, Icons.history, 'Order History', onTapProfileOption: () {  }),
                    SizedBox(height: 16),
                    _buildProfileOption(context, Icons.notifications, 'Notifications', onTapProfileOption: () {
                      navKey.currentState?.push(MaterialPageRoute(builder: (_)=>NotificationPage()));
                    }),
                    SizedBox(height: 16),
                    _buildProfileOption(context, Icons.account_balance_wallet, 'Bank Accounts', onTapProfileOption: () {
                      navKey.currentState?.push(MaterialPageRoute(builder: (_)=> BankAccountsPage(navKey: navKey)));
                    }),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: ColorConstants.primaryColor, width: 2), // Red border with 2 pixels width
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rounded corners with radius of 4
                          ),
                        ),
                        onPressed: () {
                          // Handle the button press
                        },
                        child: Text(
                          'Log Out',
                          style: BaseTextStyle(
                            fontWeight: FontWeight.w700 ,
                            fontSize: 20,
                            color: ColorConstants.primaryColor, // Red text color
                          ),
                        ),
                      ),
                    )
              
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, IconData icon, String title , { required VoidCallback onTapProfileOption}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorConstants.textColor , width: 1)
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title ,style: const  BaseTextStyle(
          color: Colors.black,
          fontSize: 16 ,
          fontWeight: FontWeight.w500
        ),),
        trailing: Icon(Icons.chevron_right),
        onTap: onTapProfileOption
      ),
    );
  }
}


