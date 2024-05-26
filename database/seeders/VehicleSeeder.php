<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Faker\Factory as FakerFactory;
use Faker\Generator as FakerGenerator;

class VehicleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        $faker = FakerFactory::create();
        // $faker = FakerFactory::create();
        $faker->addProvider(new \Faker\Provider\Fakecar($faker));

        for ($i = 0; $i < 50; $i++) {
            \App\Models\Vehicle::create([
                'brand' => $faker->vehicleBrand,
                'model' => $faker->vehicleModel,
                'plate_number' => $faker->vehicleRegistration,
                'insurance_date' => $faker->dateTimeBetween('-1 years', '+1 years')
            ]);
        }
    }
}
