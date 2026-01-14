#!/bin/bash

# Create BookingsScreen
cat > src/screens/main/BookingsScreen.js << 'EOF'
import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, FlatList, TouchableOpacity } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { dbHelpers, authHelpers } from '../../config/supabase';
import theme, { getStatusColor } from '../../config/theme';

export default function BookingsScreen({ navigation }) {
  const [bookings, setBookings] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    loadBookings();
  }, []);

  const loadBookings = async () => {
    setLoading(true);
    try {
      const { user } = await authHelpers.getCurrentUser();
      if (user) {
        const { data, error } = await dbHelpers.getBookings(user.id);
        if (error) throw error;
        setBookings(data || []);
      }
    } catch (error) {
      console.error('Error loading bookings:', error);
    } finally {
      setLoading(false);
    }
  };

  const renderBooking = ({ item }) => (
    <TouchableOpacity
      style={styles.bookingCard}
      onPress={() => navigation.navigate('BookingDetail', { bookingId: item.id })}
    >
      <View style={styles.bookingHeader}>
        <Text style={styles.bookingProvider}>{item.providers?.name || 'Provider'}</Text>
        <View style={[styles.statusBadge, { backgroundColor: getStatusColor(item.status) }]}>
          <Text style={styles.statusText}>{item.status}</Text>
        </View>
      </View>
      <Text style={styles.bookingDate}>{new Date(item.booking_date).toLocaleDateString()}</Text>
      <Text style={styles.bookingAmount}>EGP {item.amount?.toLocaleString()}</Text>
    </TouchableOpacity>
  );

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.screenTitle}>My Bookings</Text>
      <FlatList
        data={bookings}
        renderItem={renderBooking}
        keyExtractor={(item) => item.id}
        contentContainerStyle={styles.list}
        refreshing={loading}
        onRefresh={loadBookings}
        ListEmptyComponent={
          <View style={styles.emptyState}>
            <Ionicons name="calendar-outline" size={64} color={theme.colors.textLight} />
            <Text style={styles.emptyText}>No bookings yet</Text>
          </View>
        }
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: theme.colors.background },
  screenTitle: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold', padding: theme.spacing.lg },
  list: { padding: theme.spacing.lg },
  bookingCard: { backgroundColor: theme.colors.surface, padding: theme.spacing.md, borderRadius: theme.borderRadius.lg, marginBottom: theme.spacing.md },
  bookingHeader: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginBottom: theme.spacing.sm },
  bookingProvider: { fontSize: theme.fontSizes.lg, fontWeight: 'bold', color: theme.colors.text, flex: 1 },
  statusBadge: { paddingHorizontal: theme.spacing.sm, paddingVertical: theme.spacing.xs, borderRadius: theme.borderRadius.sm },
  statusText: { fontSize: theme.fontSizes.xs, color: '#FFFFFF', fontWeight: '600', textTransform: 'uppercase' },
  bookingDate: { fontSize: theme.fontSizes.sm, color: theme.colors.textSecondary, marginBottom: theme.spacing.xs },
  bookingAmount: { fontSize: theme.fontSizes.lg, fontWeight: 'bold', color: theme.colors.primary },
  emptyState: { alignItems: 'center', justifyContent: 'center', paddingVertical: theme.spacing['2xl'] * 2 },
  emptyText: { fontSize: theme.fontSizes.lg, color: theme.colors.textSecondary, marginTop: theme.spacing.md },
});
EOF

# Create ProfileScreen
cat > src/screens/main/ProfileScreen.js << 'EOF'
import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, TouchableOpacity, Image, ScrollView } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { authHelpers } from '../../config/supabase';
import theme from '../../config/theme';

export default function ProfileScreen({ navigation }) {
  const [user, setUser] = useState(null);

  useEffect(() => {
    loadUser();
  }, []);

  const loadUser = async () => {
    const { user: currentUser } = await authHelpers.getCurrentUser();
    setUser(currentUser);
  };

  const handleSignOut = async () => {
    await authHelpers.signOut();
  };

  const menuItems = [
    { icon: 'wallet-outline', label: 'Transactions', screen: 'Transactions' },
    { icon: 'alert-circle-outline', label: 'Disputes', screen: 'Disputes' },
    { icon: 'settings-outline', label: 'Settings', screen: 'Settings' },
  ];

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView>
        <View style={styles.profileHeader}>
          <Image source={{ uri: theme.images.defaultAvatar }} style={styles.avatar} />
          <Text style={styles.profileName}>{user?.user_metadata?.full_name || 'User'}</Text>
          <Text style={styles.profileEmail}>{user?.email}</Text>
        </View>

        <View style={styles.menuContainer}>
          {menuItems.map((item, index) => (
            <TouchableOpacity
              key={index}
              style={styles.menuItem}
              onPress={() => navigation.navigate(item.screen)}
            >
              <Ionicons name={item.icon} size={24} color={theme.colors.text} />
              <Text style={styles.menuLabel}>{item.label}</Text>
              <Ionicons name="chevron-forward" size={24} color={theme.colors.textLight} />
            </TouchableOpacity>
          ))}
        </View>

        <TouchableOpacity style={styles.signOutButton} onPress={handleSignOut}>
          <Text style={styles.signOutText}>Sign Out</Text>
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: theme.colors.background },
  profileHeader: { alignItems: 'center', padding: theme.spacing.xl, backgroundColor: theme.colors.surface },
  avatar: { width: 100, height: 100, borderRadius: 50, marginBottom: theme.spacing.md },
  profileName: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold', color: theme.colors.text, marginBottom: theme.spacing.xs },
  profileEmail: { fontSize: theme.fontSizes.base, color: theme.colors.textSecondary },
  menuContainer: { padding: theme.spacing.lg },
  menuItem: { flexDirection: 'row', alignItems: 'center', backgroundColor: theme.colors.surface, padding: theme.spacing.md, borderRadius: theme.borderRadius.lg, marginBottom: theme.spacing.md },
  menuLabel: { flex: 1, marginLeft: theme.spacing.md, fontSize: theme.fontSizes.base, color: theme.colors.text },
  signOutButton: { backgroundColor: theme.colors.error, margin: theme.spacing.lg, padding: theme.spacing.md, borderRadius: theme.borderRadius.lg, alignItems: 'center' },
  signOutText: { color: '#FFFFFF', fontSize: theme.fontSizes.lg, fontWeight: 'bold' },
});
EOF

echo "All main screens created successfully!"
