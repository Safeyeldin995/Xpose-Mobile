#!/bin/bash

# ProviderDetailScreen
cat > src/screens/details/ProviderDetailScreen.js << 'EOF'
import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, Image } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { dbHelpers } from '../../config/supabase';
import theme from '../../config/theme';

export default function ProviderDetailScreen({ route, navigation }) {
  const { providerId } = route.params;
  const [provider, setProvider] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadProvider();
  }, []);

  const loadProvider = async () => {
    try {
      const { data } = await dbHelpers.getProviderById(providerId);
      setProvider(data);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  if (loading || !provider) return <View style={styles.container}><Text>Loading...</Text></View>;

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView>
        <Image source={{ uri: provider.logo || theme.images.defaultChannelLogo }} style={styles.coverImage} />
        <View style={styles.content}>
          <Text style={styles.name}>{provider.name}</Text>
          <Text style={styles.category}>{provider.category}</Text>
          <Text style={styles.description}>{provider.description || 'No description available'}</Text>
          <View style={styles.priceContainer}>
            <Text style={styles.priceLabel}>Starting from</Text>
            <Text style={styles.price}>EGP {provider.base_price?.toLocaleString()}</Text>
          </View>
          <TouchableOpacity 
            style={styles.bookButton}
            onPress={() => navigation.navigate('BookingCheckout', { provider })}
          >
            <Text style={styles.bookButtonText}>Book Now</Text>
          </TouchableOpacity>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: theme.colors.background },
  coverImage: { width: '100%', height: 250, backgroundColor: theme.colors.surface },
  content: { padding: theme.spacing.lg },
  name: { fontSize: theme.fontSizes['3xl'], fontWeight: 'bold', color: theme.colors.text },
  category: { fontSize: theme.fontSizes.base, color: theme.colors.textSecondary, marginTop: theme.spacing.xs, textTransform: 'capitalize' },
  description: { fontSize: theme.fontSizes.base, color: theme.colors.text, marginTop: theme.spacing.lg, lineHeight: 24 },
  priceContainer: { marginTop: theme.spacing.xl, backgroundColor: theme.colors.surface, padding: theme.spacing.md, borderRadius: theme.borderRadius.md },
  priceLabel: { fontSize: theme.fontSizes.sm, color: theme.colors.textSecondary },
  price: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold', color: theme.colors.primary, marginTop: theme.spacing.xs },
  bookButton: { backgroundColor: theme.colors.primary, padding: theme.spacing.md, borderRadius: theme.borderRadius.md, alignItems: 'center', marginTop: theme.spacing.lg },
  bookButtonText: { color: '#FFFFFF', fontSize: theme.fontSizes.lg, fontWeight: 'bold' },
});
EOF

# BookingDetailScreen
cat > src/screens/details/BookingDetailScreen.js << 'EOF'
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import theme from '../../config/theme';

export default function BookingDetailScreen({ route }) {
  const { bookingId } = route.params;
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>Booking Details</Text>
      <Text>Booking ID: {bookingId}</Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: theme.spacing.lg, backgroundColor: theme.colors.background },
  title: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold', marginBottom: theme.spacing.md },
});
EOF

# BookingCheckoutScreen
cat > src/screens/details/BookingCheckoutScreen.js << 'EOF'
import React, { useState } from 'react';
import { View, Text, StyleSheet, TouchableOpacity, TextInput, Alert } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { dbHelpers, authHelpers } from '../../config/supabase';
import theme from '../../config/theme';

export default function BookingCheckoutScreen({ route, navigation }) {
  const { provider } = route.params;
  const [bookingDate, setBookingDate] = useState('');
  const [loading, setLoading] = useState(false);

  const handleCheckout = async () => {
    if (!bookingDate) {
      Alert.alert('Error', 'Please select a booking date');
      return;
    }

    setLoading(true);
    try {
      const { user } = await authHelpers.getCurrentUser();
      const { data, error } = await dbHelpers.createBooking({
        user_id: user.id,
        provider_id: provider.id,
        booking_date: bookingDate,
        amount: provider.base_price,
        status: 'pending'
      });

      if (error) throw error;

      Alert.alert('Success', 'Booking created successfully!', [
        { text: 'OK', onPress: () => navigation.navigate('Bookings') }
      ]);
    } catch (error) {
      Alert.alert('Error', error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>Complete Booking</Text>
      <Text style={styles.providerName}>{provider.name}</Text>
      <View style={styles.form}>
        <Text style={styles.label}>Booking Date</Text>
        <TextInput
          style={styles.input}
          placeholder="YYYY-MM-DD"
          value={bookingDate}
          onChangeText={setBookingDate}
        />
        <View style={styles.summary}>
          <Text style={styles.summaryLabel}>Total Amount</Text>
          <Text style={styles.summaryValue}>EGP {provider.base_price?.toLocaleString()}</Text>
        </View>
        <TouchableOpacity 
          style={[styles.checkoutButton, loading && styles.buttonDisabled]}
          onPress={handleCheckout}
          disabled={loading}
        >
          <Text style={styles.checkoutButtonText}>
            {loading ? 'Processing...' : 'Confirm Booking'}
          </Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: theme.spacing.lg, backgroundColor: theme.colors.background },
  title: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold', marginBottom: theme.spacing.sm },
  providerName: { fontSize: theme.fontSizes.lg, color: theme.colors.textSecondary, marginBottom: theme.spacing.xl },
  form: { marginTop: theme.spacing.lg },
  label: { fontSize: theme.fontSizes.sm, fontWeight: '600', color: theme.colors.text, marginBottom: theme.spacing.sm },
  input: { backgroundColor: theme.colors.surface, padding: theme.spacing.md, borderRadius: theme.borderRadius.md, fontSize: theme.fontSizes.base, marginBottom: theme.spacing.lg },
  summary: { backgroundColor: theme.colors.surface, padding: theme.spacing.md, borderRadius: theme.borderRadius.md, marginBottom: theme.spacing.lg },
  summaryLabel: { fontSize: theme.fontSizes.sm, color: theme.colors.textSecondary },
  summaryValue: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold', color: theme.colors.primary, marginTop: theme.spacing.xs },
  checkoutButton: { backgroundColor: theme.colors.primary, padding: theme.spacing.md, borderRadius: theme.borderRadius.md, alignItems: 'center' },
  checkoutButtonText: { color: '#FFFFFF', fontSize: theme.fontSizes.lg, fontWeight: 'bold' },
  buttonDisabled: { opacity: 0.6 },
});
EOF

# ReviewScreen
cat > src/screens/details/ReviewScreen.js << 'EOF'
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import theme from '../../config/theme';

export default function ReviewScreen() {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>Write Review</Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: theme.spacing.lg, backgroundColor: theme.colors.background },
  title: { fontSize: theme.fontSizes['2xl'], fontWeight: 'bold' },
});
EOF

echo "Detail screens created!"
