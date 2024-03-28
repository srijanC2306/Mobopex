import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/asset_constants.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:MoboPex/src/view/ui/widgets/navigator/base_navigator.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context) ;
    return BaseNavigator(
      builder: (navKey)=>Scaffold(
        appBar: AppBar(
          leading: BackButton(), // Use your own custom back button if needed
          title: Text('My Profile'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
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
                  _buildProfileOption(context, Icons.edit, 'Edit Profile'),
                  SizedBox(height: 16),
                  _buildProfileOption(context, Icons.location_on, 'Shipping Address'),
                  SizedBox(height: 16),
                  _buildProfileOption(context, Icons.favorite_border, 'Wishlist'),
                  SizedBox(height: 16),
                  _buildProfileOption(context, Icons.history, 'Order History'),
                  SizedBox(height: 16),
                  _buildProfileOption(context, Icons.notifications, 'Notifications'),
                  SizedBox(height: 16),
                  _buildProfileOption(context, Icons.account_balance_wallet, 'Bank Accounts'),
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
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorConstants.textColor , width: 1)
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title ,style: BaseTextStyle(
          color: Colors.black,
          fontSize: 16 ,
          fontWeight: FontWeight.w500
        ),),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          // Handle navigation
        },
      ),
    );
  }
}


